#!/bin/bash
# Script de build para site bilíngue Quarto + GitHub Pages

echo "🧹 Limpando diretório _site..."
rm -rf _site

echo "📦 Renderizando versão em Português..."
cd pt
quarto render
cd ..

echo "📦 Renderizando versão em Inglês..."
cd en
quarto render
cd ..

echo "📦 Criando página raiz de redirecionamento..."
quarto render index.qmd --to html --output-dir _site

echo "🌐 Copiando CNAME (domínio personalizado)..."
cp CNAME _site/CNAME

echo "✅ Build concluído!"
echo "📂 Estrutura gerada:"
ls -la _site
echo ""
ls -la _site/pt 2>/dev/null && echo "  ✓ Português OK"
ls -la _site/en 2>/dev/null && echo "  ✓ Inglês OK"
test -f _site/.nojekyll && echo "  ✓ .nojekyll presente"
