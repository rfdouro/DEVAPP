@REM No Windows (Prompt de Comando/PowerShell)
@REM Coloque o script em uma pasta fixa, por exemplo: C:\Scripts\convertmd2pdf.py.
@REM Adicione essa pasta ao PATH:
@REM Abra o Painel de Controle > Sistema > Configurações avançadas do sistema > Variáveis de ambiente.
@REM Em Variáveis do sistema, encontre Path, edite e adicione C:\Scripts.
@REM Clique em OK e reinicie o prompt.
@REM Crie um arquivo .bat na mesma pasta com o nome convert2pdf.bat contendo:
@REM batch
@REM @echo off
@REM python C:\Scripts\convertmd2pdf.py %*
@REM Agora você pode digitar convert2pdf -f doc.md -c style.css de qualquer lugar.

@REM com a definição do css, a chamada pode ser direta
@REM convertmd2pdf -f caminho\do\arquivo.md -o caminho\do\arquivo.pdf

@echo off
python %SCRIPTSDIR%\convertmd2pdf.py -c %SCRIPTSDIR%\markdown-pdf.css %*