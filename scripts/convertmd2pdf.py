#!/usr/bin/env python
# -*- coding: utf-8 -*-

# convert2pdf.py – Converte Markdown para PDF com CSS e adiciona bookmarks.
# Uso: python convert2pdf.py -f documento.md -c estilo.css [-o saida.pdf] [-t 0.5]

# Exemplo: python convert2pdf.py -f SUPABASE\src\Tutorial.Supabase.md -c markdown-pdf.css -o SUPABASE\share\Tutorial.Supabase.pdf

# Dependências:
#     pip install markdown playwright cssutils PyMuPDF
#     playwright install chromium

#para o correto funcionamento, o tamanho das fontes de h1, h2, ... devem ser diferentes do tamanho do texto

import sys
import getopt
import re
import os
import tempfile

import markdown
from playwright.sync_api import sync_playwright
import pymupdf as fitz
import cssutils

__version__ = '1.0.3'


# ============================================================
# 1. Função de conversão MD -> PDF com Playwright (com imagens)
# ============================================================

def convert_md_to_pdf(md_file, css_file, output_pdf):
    """
    Converte Markdown para PDF usando Playwright.
    Cria um HTML temporário no mesmo diretório do .md para resolver caminhos de imagem.
    """
    with open(md_file, 'r', encoding='utf-8') as f:
        md_content = f.read()

    # Converte Markdown -> HTML
    html_body = markdown.markdown(md_content, extensions=['extra', 'toc'])

    # Lê o CSS
    with open(css_file, 'r', encoding='utf-8') as f:
        css_text = f.read()

    # Monta HTML completo
    html_full = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <style>{css_text}</style>
    </head>
    <body>
        {html_body}
    </body>
    </html>
    """

    # Cria um arquivo HTML temporário no mesmo diretório do Markdown
    base_dir = os.path.dirname(md_file) or '.'
    with tempfile.NamedTemporaryFile(
        mode='w', suffix='.html', dir=base_dir, delete=False, encoding='utf-8'
    ) as f:
        temp_html_path = f.name
        f.write(html_full)

    # Converte para PDF com Playwright (carregando via file://)
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()
        # Converte caminho para URL file:// (formato correto para Windows/Linux)
        file_url = f"file:///{temp_html_path.replace(os.sep, '/')}"
        page.goto(file_url)
        page.pdf(
            path=output_pdf,
            format='A4',
            margin={
                'top': '20mm',
                'bottom': '20mm',
                'left': '15mm',
                'right': '15mm'
            },
            print_background=True
        )
        browser.close()

    # Remove o HTML temporário
    os.unlink(temp_html_path)
    print(f"✅ PDF gerado: {output_pdf}")


# ============================================================
# 2. Funções de extração de cabeçalhos e bookmarks (inalteradas)
# ============================================================

def parse_css(css_file):
    """Extrai tamanhos de fonte (em pt) dos seletores h1–h4."""
    with open(css_file, 'rb') as f:
        css_text = f.read()

    sheet = cssutils.parseString(css_text)
    heading_sizes = {}

    for rule in sheet:
        selector = rule.selectorText
        if not selector:
            continue
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
            continue

        num_match = re.search(r'(\d+\.?\d*)', font_size_value)
        if num_match:
            heading_sizes[level] = float(num_match.group(1))
            print(f"DEBUG: {selector} -> {heading_sizes[level]}pt")
        else:
            print(f"Aviso: não foi possível interpretar 'font-size: {font_size_value}'")

    if not heading_sizes:
        print("Erro: nenhum seletor h1-h4 com 'font-size' encontrado no CSS.")
        sys.exit(1)
    return heading_sizes


def extract_headings_from_pdf(pdf_file, heading_sizes, tolerance=0.5):
    """Percorre o PDF e identifica textos que são cabeçalhos (tamanho + padrão capítulo)."""
    doc = fitz.open(pdf_file)
    headings = []

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

                    #if not chapter_pattern.match(text):
                    #    continue

                    pdf_size = span["size"]
                    for level, css_size in heading_sizes.items():
                        if abs(pdf_size - css_size) <= tolerance:
                            headings.append({
                                'level': level,
                                'text': text,
                                'page_num': page_num,
                                'y': span['bbox'][1]
                            })
                            print(f"✅ Cabeçalho: nível {level}, texto '{text}', "
                                  f"página {page_num}, tamanho {pdf_size:.2f}pt")
                            break

    doc.close()
    return headings


def add_bookmarks_to_pdf(pdf_file, headings, output_file=None):
    """Adiciona os bookmarks ao PDF."""
    if not headings:
        print("Nenhum cabeçalho encontrado para gerar bookmarks.")
        return

    doc = fitz.open(pdf_file)

    if doc.get_toc():
        print("O PDF já possui índice. Pulando adição de bookmarks.")
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
    print(f"✅ Bookmarks adicionados! Arquivo salvo como: {output_file}")


# ============================================================
# 3. Função principal
# ============================================================

def main(argv):
    md_file = None
    css_file = None
    output_pdf = None
    tolerance = 0.5

    try:
        opts, args = getopt.getopt(
            argv, "hf:c:o:t:", ["help", "md=", "css=", "output=", "tolerance="]
        )
    except getopt.GetoptError as err:
        print(str(err))
        print("Uso: python convert2pdf.py -f documento.md -c estilo.css [-o saida.pdf] [-t 0.5]")
        sys.exit(2)

    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print(__doc__)
            sys.exit(0)
        elif opt in ("-f", "--md"):
            md_file = arg
        elif opt in ("-c", "--css"):
            css_file = arg
        elif opt in ("-o", "--output"):
            output_pdf = arg
        elif opt in ("-t", "--tolerance"):
            try:
                tolerance = float(arg)
            except ValueError:
                print("A tolerância deve ser um número (ex: 0.5)")
                sys.exit(2)

    if not md_file or not css_file:
        print("Erro: é obrigatório fornecer os arquivos .md e .css.")
        print("Use -f para o Markdown e -c para o CSS.")
        sys.exit(1)

    if not output_pdf:
        base = os.path.splitext(md_file)[0]
        output_pdf = base + ".pdf"

    # Passo 1: Converter MD para PDF com Playwright
    convert_md_to_pdf(md_file, css_file, output_pdf)

    # Passo 2: Extrair cabeçalhos e adicionar bookmarks
    heading_sizes = parse_css(css_file)
    headings = extract_headings_from_pdf(output_pdf, heading_sizes, tolerance)

    base_out, ext_out = os.path.splitext(output_pdf)
    final_pdf = f"{base_out}_com_bookmarks{ext_out}"
    add_bookmarks_to_pdf(output_pdf, headings, final_pdf)

    print(f"\n🎉 Processo concluído! PDF final com bookmarks: {final_pdf}")


if __name__ == "__main__":
    main(sys.argv[1:])