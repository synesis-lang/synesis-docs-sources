# Synesis Language Documentation

Documentação bilíngue (Português/Inglês) do Synesis Language, construída com Quarto e otimizada para GitHub Pages.

## Estrutura do Site

```
synesis-docs-sources/
├── pt/                          # Versão em Português
│   ├── _quarto.yml              # Configuração PT
│   ├── index.qmd
│   ├── about.qmd
│   ├── tutorials/
│   │   ├── getting-started.qmd
│   │   ├── synesis_claude_desktop.qmd
│   │   ├── guia_pesquisadores.qmd
│   │   ├── synesis_explorer_tutorial.qmd
│   │   └── synesis_para_iramuteq.qmd
│   ├── howto/
│   │   ├── guia_profissionais.qmd
│   │   ├── synesis_coder.qmd
│   │   ├── definir_ontologia.qmd
│   │   ├── criar_chains.qmd
│   │   ├── ligar_projetos.qmd
│   │   └── exportar_neo4j.qmd
│   ├── reference/
│   │   ├── guia_referencia.qmd
│   │   ├── modelo_organizador.qmd
│   │   ├── gramatica.qmd
│   │   ├── guia_erros.qmd
│   │   ├── synesis_load.qmd
│   │   ├── synesis_graph.qmd
│   │   └── fluxo_compilacao.qmd
│   └── explanation/             # 20 páginas; explanation/index.qmd é o sumário
├── en/                          # Versão em Inglês: as mesmas páginas e nomes de arquivo
│   ├── _quarto.yml              # (exceção: reference/organizing_model.qmd)
│   └── ...
├── images/                      # Assets visuais (25 imagens)
├── synesis-landing/             # Páginas de landing
├── index.qmd                   # Página raiz com redirecionamento automático
├── _quarto.yml                  # Configuração global
├── synesis.scss                 # Tema customizado
├── synesis.xml                  # Syntax highlighting para Synesis Language
├── references.bib               # Bibliografias
├── apa.csl                      # Estilo de citação APA
├── build.bat                    # Script de build (Windows)
├── build.sh                     # Script de build (Linux/macOS)
└── _site/                       # Output (GitHub Pages)
    ├── .nojekyll                # Necessário para GitHub Pages
    ├── index.html               # Redireciona automaticamente
    ├── pt/                      # Site em Português
    └── en/                      # Site em Inglês
```

## Build & Deploy

### Build Local

**Windows:**
```cmd
build.bat
```

**Linux/macOS:**
```bash
bash build.sh
```

Ou manualmente:
```bash
cd pt && quarto render && cd ..
cd en && quarto render && cd ..
quarto render index.qmd --to html --output-dir _site
```

### Preview Local

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

### Publicação

O site publicado (synesis-lang.org) vem do repositório `synesis-docs`, branch `gh-pages`. Depois do build, o conteúdo de `_site/` é copiado para esse repositório, preservando o arquivo `CNAME`, e então enviado com `git push`. A pasta `_site/` não é versionada neste repositório.

Algumas páginas de Explanation executam Python durante a renderização (`jupyter: python3`) e dependem de `pandas` (com `jinja2` compatível), `plotly`, `matplotlib`, `networkx` e `synesis`, além dos dados locais em `case-studies/`, que não são versionados.

## Funcionalidades

### Redirecionamento Automático por Idioma
O [index.qmd](index.qmd) detecta o idioma do navegador e redireciona para `/pt/` ou `/en/`

### Seletor de Idioma
Cada versão (PT/EN) tem um menu de idiomas no canto superior direito da navbar.

### Organização Diataxis
O conteúdo segue o framework [Diataxis](Diataxis_principle.md), organizado em 4 tipos:
- **Tutorials** — aprendizado orientado a objetivos
- **How-to Guides** — guias para tarefas específicas
- **Explanation** — compreensão aprofundada
- **Reference** — informação técnica precisa

### Temas e Sintaxe
- Tema customizado: `synesis.scss`
- Syntax highlighting para Synesis Language: `synesis.xml`
- Bibliografias: `references.bib` com estilo APA (`apa.csl`)

## Desenvolvimento

### Adicionar Nova Página

1. Crie o arquivo `.qmd` na pasta correta em `pt/` e em `en/`, com o mesmo nome
2. Adicione a referência em `pt/_quarto.yml` e/ou `en/_quarto.yml`:

```yaml
website:
  navbar:
    left:
      - text: "Reference"
        menu:
          - href: reference/nova-pagina.qmd
            text: Nova Página
```

3. Execute `quarto preview` ou `build.bat` para validar

## Requisitos

- [Quarto](https://quarto.org) >= 1.5
- Git (para deploy)

## Recursos

- [Documentação Quarto](https://quarto.org/docs/)
- [GitHub Pages](https://pages.github.com/)
- [Quarto Websites](https://quarto.org/docs/websites/)
- [Framework Diataxis](https://diataxis.fr/)
