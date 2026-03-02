# Synesis Language Documentation

Documentação bilíngue (Português/Inglês) do Synesis Language, construída com Quarto e otimizada para GitHub Pages.

## Estrutura do Site

```
synesis-docs-sources/
├── pt/                          # Versão em Português
│   ├── _quarto.yml              # Configuração PT
│   ├── index.qmd
│   ├── about.qmd
│   ├── explanation/             # Explicações aprofundadas
│   │   ├── posicionamento_arquitetural.qmd
│   │   ├── por_que_estrutura_importa.qmd
│   │   ├── guia_sincero.qmd
│   │   ├── synesis_escrituras.qmd
│   │   ├── knowledge_graphs.qmd
│   │   ├── ideas.qmd
│   │   ├── show_case.qmd
│   │   ├── exemplos_codificacao.qmd
│   │   ├── codificacao_assistida_IA.qmd
│   │   ├── codificacao_assistida_IA_metricas.qmd
│   │   ├── como_surgiu.qmd
│   │   └── dsap.qmd
│   ├── howto/                   # Guias práticos
│   │   ├── guia_profissionais.qmd
│   │   ├── definir_ontologia.qmd
│   │   ├── criar_chains.qmd
│   │   └── exportar_neo4j.qmd
│   ├── reference/               # Referência da linguagem
│   │   ├── guia_referencia.qmd
│   │   ├── synesis_load.qmd
│   │   └── fluxo_compilacao.qmd
│   └── tutorials/               # Tutoriais
│       ├── getting-started.qmd
│       ├── guia_pesquisadores.qmd
│       └── synesis_explorer_tutorial.qmd
├── en/                          # Versão em Inglês
│   ├── _quarto.yml              # Configuração EN
│   ├── index.qmd
│   ├── about.qmd
│   ├── explanation/
│   │   ├── guia_sincero.qmd
│   │   ├── knowledge_graphs.qmd
│   │   └── ideas.qmd
│   ├── howto/
│   │   ├── guia_profissionais.qmd
│   │   └── exportar_neo4j.qmd
│   ├── ecossistema/
│   │   └── synesis2neo4j_en.qmd
│   ├── reference/
│   │   ├── guia_referencia.qmd
│   │   └── synesis_load.qmd
│   └── tutorials/
│       ├── guia_pesquisadores.qmd
│       └── synesis_explorer_tutorial.qmd
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

### Deploy no GitHub Pages

1. Configure o repositório:
   - Vá em Settings > Pages
   - Source: Deploy from a branch
   - Branch: `main`
   - Folder: `/_site`

2. O arquivo `.nojekyll` já está configurado automaticamente no build

3. Push das alterações:
```bash
git add _site
git commit -m "Update documentation"
git push
```

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

1. Crie o arquivo `.qmd` na pasta correta em `pt/` e (opcionalmente) `en/`
2. Adicione a referência em `pt/_quarto.yml` e/ou `en/_quarto.yml`:

```yaml
website:
  sidebar:
    contents:
      - nova-pagina.qmd
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
