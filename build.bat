@echo off
REM Script de build para site bilíngue Quarto + GitHub Pages (Windows)

echo Limpando diretório _site...
if exist _site rmdir /s /q _site

echo Renderizando versão em Português...
cd pt
quarto render
cd ..

echo Renderizando versão em Inglês...
cd en
quarto render
cd ..

echo Criando página raiz de redirecionamento...
quarto render index.qmd --to html --output-dir _site

echo Build concluído!
echo Estrutura gerada:
dir _site
if exist _site\pt echo   Português OK
if exist _site\en echo   Inglês OK
if exist _site\.nojekyll echo   .nojekyll presente
