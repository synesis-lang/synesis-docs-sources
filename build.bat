@echo off
chcp 65001 >nul
REM Script de build para site bilingue Quarto + GitHub Pages (Windows)

echo Limpando diretorio _site...
if exist _site rmdir /s /q _site

echo Renderizando versao em Portugues...
cd pt
call quarto render
if errorlevel 1 (
    echo ERRO: falha ao renderizar pt. Abortando.
    cd ..
    exit /b 1
)
cd ..

echo Renderizando versao em Ingles...
cd en
call quarto render
if errorlevel 1 (
    echo ERRO: falha ao renderizar en. Abortando.
    cd ..
    exit /b 1
)
cd ..

echo Criando pagina raiz de redirecionamento...
call quarto render index.qmd --to html --output-dir _site
if errorlevel 1 (
    echo ERRO: falha ao renderizar index.qmd. Abortando.
    exit /b 1
)

echo Copiando landing pages para _site\landing\...
xcopy /E /I /Y synesis-landing _site\landing >nul

echo Build concluido!
echo Estrutura gerada:
dir _site
if exist _site\pt      echo   Documentacao PT OK
if exist _site\en      echo   Documentacao EN OK
if exist _site\landing echo   Landing page OK
if exist _site\.nojekyll echo   .nojekyll presente
