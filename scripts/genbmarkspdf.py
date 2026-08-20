#!/usr/bin/env python
# -*- coding: utf-8 -*-


# AutoPDFBookmark – Geração automática de índices (bookmarks) em PDF
# baseada no tamanho da fonte definido em um arquivo CSS.

# Uso:
#     python autogenbookmarks.py -f documento.pdf -c estilo.css [-t 0.5]

# Requisitos:
#     - PyMuPDF (pip install PyMuPDF)
#     - cssutils (pip install cssutils)


import sys
import getopt
import re
import math
import os

import fitz  # PyMuPDF
import cssutils

__version__ = '0.6.0'
__author__ = 'Castle (melhorado)'


def usage():
    """Exibe as instruções de uso."""
    print(f"AutoPDFBookmark versão {__version__}")
    print("Uso:")
    print("  -f, --pdf <arquivo>    : PDF de entrada (padrão: mypdf.pdf)")
    print("  -c, --css <arquivo>    : CSS com estilos (padrão: markdownhere.css)")
    print("  -t, --tolerance <float>: tolerância em pt para comparação (padrão: 0.5)")
    print("  -h, --help             : mostra esta ajuda")


def parse_css(css_file):
    """
    Extrai o tamanho da fonte (em pt) para os seletores h1, h2, h3, h4.

    Retorna:
        dict: {nível: tamanho_em_pt}  ex: {1: 28.0, 2: 20.0, ...}
    """
    with open(css_file, 'rb') as f:
        css_text = f.read()

    sheet = cssutils.parseString(css_text)
    heading_sizes = {}

    for rule in sheet:
        selector = rule.selectorText
        if not selector:
            continue

        # Verifica se o seletor é h1, h2, h3 ou h4
        m = re.match(r'^h([1-4])$', selector.strip())
        if not m:
            continue

        level = int(m.group(1))
        font_size_value = None

        for prop in rule.style:
            if prop.name == 'font-size':
                font_size_value = prop.value
                break

        if not font_size_value:
            print(f"Aviso: seletor {selector} não possui 'font-size'")
            continue

        # Extrai o número (inteiro ou decimal)
        num_match = re.search(r'(\d+\.?\d*)', font_size_value)
        if num_match:
            size_pt = float(num_match.group(1))
            heading_sizes[level] = size_pt
            print(f"DEBUG: {selector} -> {size_pt}pt")
        else:
            print(f"Aviso: não foi possível interpretar 'font-size: {font_size_value}'")

    if not heading_sizes:
        print("Erro: nenhum seletor h1-h4 com 'font-size' encontrado no CSS.")
        sys.exit(1)

    return heading_sizes


def extract_headings_from_pdf(pdf_file, heading_sizes, tolerance=0.5):
    """
    Percorre o PDF e identifica textos que coincidem com os tamanhos de fonte
    dos cabeçalhos (h1–h4) e que começam com numeração de capítulo.

    Retorna:
        list: dicionários com {'level', 'text', 'page_num', 'y'}
    """
    doc = fitz.open(pdf_file)
    headings = []

    # Padrão para números de capítulo: "1.", "1.1", "1.1.1", etc.
    chapter_pattern = re.compile(r'^(\d+\.\d+\.\d+)|(\d+\.\d+)|(\d+\.)')

    for page_num in range(1, len(doc) + 1):
        page = doc[page_num - 1]
        blocks = page.get_text("dict", flags=11)["blocks"]

        for block in blocks:
            if "lines" not in block:
                continue
            for line in block["lines"]:
                for span in line["spans"]:
                    text = span["text"].strip()
                    if not text:
                        continue

                    # (Opcional) Para depuração: veja todos os spans
                    # print(f"Pág {page_num}: '{text}' | tam={span['size']:.2f} | flags={span['flags']}")

                    # Ignora se não começar com número de capítulo
                    #if not chapter_pattern.match(text):
                    #    continue

                    pdf_size = span["size"]
                    # Compara com cada nível definido no CSS
                    for level, css_size in heading_sizes.items():
                        if abs(pdf_size - css_size) <= tolerance:
                            headings.append({
                                'level': level,
                                'text': text,
                                'page_num': page_num,
                                'y': span['bbox'][1]   # coordenada Y (topo do span)
                            })
                            print(f"✅ Cabeçalho: nível {level}, texto '{text}', "
                                  f"página {page_num}, tamanho {pdf_size:.2f}pt")
                            break  # evita duplicar o mesmo span

    doc.close()
    return headings


def add_bookmarks_to_pdf(pdf_file, headings, output_file=None):
    """
    Adiciona os bookmarks ao PDF a partir da lista de cabeçalhos extraídos.
    """
    if not headings:
        print("Nenhum cabeçalho encontrado para gerar bookmarks.")
        return

    doc = fitz.open(pdf_file)

    # Verifica se já existe TOC
    if doc.get_toc():
        print("O PDF já possui índice. O script não sobrescreverá.")
        doc.close()
        return

    toc = []
    for h in headings:
        point = fitz.Point(0, h['y'])
        toc.append([
            h['level'],
            h['text'],
            h['page_num'],
            {'kind': fitz.LINK_GOTO, 'to': point, 'collapse': 1}
        ])

    if not toc:
        print("Nenhum bookmark válido para adicionar.")
        doc.close()
        return

    doc.set_toc(toc)

    if output_file is None:
        base, ext = os.path.splitext(pdf_file)
        output_file = f"{base}_com_bookmarks.pdf"

    doc.save(output_file)
    doc.close()
    print(f"✅ Bookmarks adicionados com sucesso! Arquivo salvo como: {output_file}")


def main(argv):
    pdf_file = 'mypdf.pdf'
    css_file = 'markdownhere.css'
    tolerance = 0.5

    try:
        opts, args = getopt.getopt(
            argv, "hf:c:t:", ["help", "pdf=", "css=", "tolerance="]
        )
    except getopt.GetoptError as err:
        print(str(err))
        usage()
        sys.exit(2)

    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit(0)
        elif opt in ("-f", "--pdf"):
            pdf_file = arg
        elif opt in ("-c", "--css"):
            css_file = arg
        elif opt in ("-t", "--tolerance"):
            try:
                tolerance = float(arg)
            except ValueError:
                print("A tolerância deve ser um número (ex: 0.5)")
                sys.exit(2)

    # 1. Parse do CSS
    heading_sizes = parse_css(css_file)

    # 2. Extração dos cabeçalhos do PDF
    headings = extract_headings_from_pdf(pdf_file, heading_sizes, tolerance)

    # 3. Adição dos bookmarks
    add_bookmarks_to_pdf(pdf_file, headings)


if __name__ == "__main__":
    main(sys.argv[1:])