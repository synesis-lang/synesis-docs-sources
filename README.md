# Synesis Language Documentation

Documentação bilíngue (Português/Inglês) do Synesis Language, construída com Quarto e otimizada para GitHub Pages.

## 🌐 Estrutura do Site

```
synesis-docs/
├── pt/               # Versão em Português
│   ├── _quarto.yml   # Configuração PT
│   ├── index.qmd
│   ├── guide/
│   ├── reference/
│   └── ecossistema/
├── en/               # Versão em Inglês
│   ├── _quarto.yml   # Configuração EN
│   ├── index.qmd
│   ├── guide/
│   ├── reference/
│   └── ecossistema/
├── index.qmd         # Página raiz com redirecionamento automático
├── _quarto.yml       # Configuração global
└── _site/            # Output (GitHub Pages)
    ├── .nojekyll     # Necessário para GitHub Pages
    ├── index.html    # Redireciona automaticamente
    ├── pt/           # Site em Português
    └── en/           # Site em Inglês
```

## 🚀 Build & Deploy

### Build Local

Para construir o site localmente:

**Windows (PowerShell):**
```powershell
.\build.bat
```

**Windows (CMD):**
```cmd
build.bat
```

**Linux/Mac:**
```bash
bash build.sh
```

Ou manualmente:
```bash
cd pt && quarto render && cd ..
cd en && quarto render && cd ..
quarto render index.qmd --to html --output-dir _site
```

### Deploy no GitHub Pages

1. Configure o repositório:
   - Vá em Settings > Pages
   - Source: Deploy from a branch
   - Branch: `main` (ou sua branch)
   - Folder: `/_site`

2. O arquivo `.nojekyll` já está configurado automaticamente no build

3. Push das alterações:
```bash
git add _site
git commit -m "Update documentation"
git push
```

## 🎨 Funcionalidades

### Redirecionamento Automático por Idioma
O [index.qmd](index.qmd) detecta o idioma do navegador e redireciona para `/pt/` ou `/en/`

### Seletor de Idioma
Cada versão (PT/EN) tem um menu de idiomas no canto superior direito da navbar.

### Temas e Sintaxe
- Tema customizado: `synesis.scss`
- Syntax highlighting para Synesis Language: `synesis.xml`
- Bibliografias: `references.bib` com estilo APA (`apa.csl`)

## 📝 Desenvolvimento

### Adicionar Nova Página

1. Crie o arquivo `.qmd` em `pt/` e `en/`
2. Adicione a referência em `pt/_quarto.yml` e `en/_quarto.yml`:

```yaml
website:
  navbar:
    left:
      - href: nova-pagina.qmd
        text: Nova Página
  sidebar:
    contents:
      - nova-pagina.qmd
```

3. Rebuild o site

### Preview Local

Para visualizar alterações em tempo real:

**Português:**
```bash
cd pt
quarto preview
```

**Inglês:**
```bash
cd en
quarto preview
```

## 🔧 Requisitos

- [Quarto](https://quarto.org) >= 1.5
- Git (para deploy)

## 📚 Recursos

- [Documentação Quarto](https://quarto.org/docs/)
- [GitHub Pages](https://pages.github.com/)
- [Quarto Websites](https://quarto.org/docs/websites/)
