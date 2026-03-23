# Da Planilha à Linguagem: A História do Nascimento do Synesis

Imagine que você é pesquisador e precisa analisar 453 artigos científicos sobre como a sociedade aceita — ou rejeita — novas tecnologias de energia. Cada artigo tem trechos importantes, cada trecho aponta para fatores como "confiança na comunidade" ou "impacto ambiental", e esses fatores se relacionam entre si de formas complexas. Como organizar tudo isso sem perder o fio da meada?

Essa foi a situação real que deu origem ao Synesis.

---

## O Começo: Anotações à Mão e Inteligência Artificial

O ponto de partida foi um processo híbrido: parte feito por humanos, parte feito por inteligência artificial. O pesquisador lia um artigo, destacava trechos relevantes, identificava os fatores presentes e descrevia como eles se relacionavam. A IA fazia o mesmo, de forma automatizada, para centenas de resumos de uma vez.

O resultado dessas anotações era salvo num formato de texto simples, usando uma linguagem de marcação desenvolvida especificamente para o projeto — chamemos de **formato DGT7**. A ideia era marcar cada elemento com um tipo de "etiqueta" identificadora. Veja um exemplo real de como uma anotação ficava:

```
[-begin_header-]
referencia_bibtex: burke2018
descricao: Explora a relação entre energia renovável e poder político
modelo_epistemico: Democracia energética
metodo: Revisão conceitual
[-end_header-]

[-begin-]
[@burke2018@]
[!Sistemas de energia distribuída permitem reorganizar estruturas 
de poder político.!]
[%Energia distribuída pode reestruturar o poder político%]
[#Energy System#][&influences&][#Governance#]
[-end-]
```

Para quem não está familiarizado com esse tipo de notação, o que está escrito acima significa: *"O artigo de Burke (2018) contém um trecho que diz que sistemas de energia distribuída influenciam a governança — e esse é o fator A influenciando o fator B."*

Cada símbolo tinha um papel preciso: `[! !]` marcava uma citação direta do artigo, `[% %]` era o comentário interpretativo do pesquisador ou da IA, `[# #]` identificava um fator, e `[& &]` indicava o tipo de relação entre dois fatores.

---

## O Problema: Funciona, mas é Frágil

O sistema funcionava. Havia scripts Python que liam esses arquivos, extraíam as informações e as inseriam num banco de dados MySQL, que por sua vez alimentava uma plataforma web para exploração e visualização.

Mas com o tempo, os problemas foram aparecendo.

**O arquivo era difícil de ler.** Para um ser humano olhando o arquivo de texto, a leitura era cansativa. Um erro de digitação num símbolo — escrever `[#Energy Sistem#]` em vez de `[#Energy System#]` — passava despercebido e criava um fator duplicado no banco de dados. Não havia nada que avisasse o pesquisador na hora do erro.

**Qualquer mudança exigia reescrever o pipeline inteiro.** Suponha que o pesquisador decidisse acrescentar um novo campo às anotações — por exemplo, registrar a escala geográfica de cada fator (local, nacional, global). Para fazer isso, era preciso modificar o script de processamento, alterar a estrutura do banco de dados MySQL, atualizar a plataforma web e reprocessar todos os arquivos existentes. Uma mudança pequena virava uma obra de reforma.

**O formato estava preso a uma pesquisa específica.** Todo o pipeline havia sido desenhado pensando nos 453 artigos sobre aceitação social de tecnologias offshore. Usar a mesma estrutura para uma pesquisa diferente — sobre percepção de riscos, por exemplo, ou sobre entrevistas com stakeholders — exigiria construir tudo do zero.

---

## A Virada: E Se Houvesse um Parser Robusto?

A primeira tentativa de solução foi modesta: construir um parser mais robusto para o formato existente. Um parser é, essencialmente, um programa que lê um texto e verifica se ele segue as regras corretas — como um corretor ortográfico, mas para estruturas de dados. Se o pesquisador escrevesse `[#Energy Sistem#]`, o parser avisaria imediatamente: *"Este fator não está definido no seu dicionário."*

Mas ao começar a construir esse parser, uma percepção foi tomando forma: se já era necessário definir regras claras sobre como os arquivos deveriam ser escritos, por que não ir um passo além e criar uma linguagem de verdade?

---

## A Ideia da Linguagem: Libertar o Método do Conteúdo

A grande inovação conceitual foi separar duas coisas que antes estavam misturadas: **o método** (como anotar, que campos existem, quais são obrigatórios) e **o conteúdo** (os dados da pesquisa em si).

No sistema antigo, se uma pesquisa usava os campos `citação`, `nota` e `código`, esses campos estavam embutidos nos scripts Python. Mudar a pesquisa significava mudar o código.

A ideia nova era criar um **arquivo de template** — um documento separado que descrevesse quais campos existem, quais são obrigatórios, de que tipo cada um é. O pesquisador definiria as regras da sua pesquisa nesse template, e o resto do sistema se adaptaria automaticamente.

Comparando os dois mundos, veja como ficaria a definição de um campo no novo sistema:

```
FIELD citation TYPE QUOTATION
    SCOPE ITEM
END FIELD

FIELD code TYPE CODE
    SCOPE ITEM
END FIELD
```

Isso diz, em linguagem quase humana: *"Existe um campo chamado 'citation', que guarda uma citação direta, e ele pertence a um item de anotação. Existe também um campo chamado 'code', que guarda códigos analíticos."*

E uma anotação, no novo formato, ficaria assim:

```
SOURCE @burke2018
    description: Explora energia renovável e poder político
END SOURCE

ITEM @burke2018
    citation: "Sistemas de energia distribuída permitem 
               reorganizar estruturas de poder político."
    note: Energia distribuída pode reestruturar o poder político
    code: Energy_System, Governance
END ITEM
```

A diferença é imediata: qualquer pessoa consegue ler esse arquivo e entender o que está escrito, sem precisar decorar o significado de `[! !]` ou `[& &]`. E se o pesquisador escrever `Governance` num item mas esquecer de definir `Governance` no dicionário de conceitos, o sistema avisa antes de qualquer problema chegar ao banco de dados.

---

## O Nascimento do Synesis

Foi assim que nasceu o Synesis: não como um projeto de software planejado do zero, mas como a resposta natural às limitações acumuladas de um pipeline de pesquisa que cresceu além do que seu formato original conseguia suportar.

O nome carrega a ideia de síntese e compreensão — um sistema que não apenas armazena dados, mas compreende a estrutura da pesquisa que o utiliza.

Ao se tornar uma linguagem formal, o Synesis herdou gratuitamente uma série de vantagens que nenhum script Python poderia oferecer sozinho. Editores de código como o VSCode passaram a poder oferecer destaque visual da sintaxe, identificação de erros em tempo real e autocompletar de campos. A saída do processo de compilação deixou de ser apenas um banco de dados MySQL e passou a poder ser JSON, CSV, Excel — ou qualquer outro formato que o pesquisador precisasse. E o template tornou a linguagem aplicável a qualquer tipo de pesquisa qualitativa, não apenas aquela que a originou.

O que começou como uma planilha de anotações num projeto específico sobre tecnologias offshore no Brasil tornou-se uma ferramenta metodológica genérica — capaz de organizar o conhecimento de qualquer pesquisa que precise transformar leituras, interpretações e relações conceituais em dados estruturados e auditáveis.


Let me read the PDF first.O PDF está em formato binário. Vou usar uma abordagem diferente para extrair o texto.Já tenho informações suficientes. Vou escrever o texto.

---

# O SocioAtlas Google Sheets: A Aposta na Colaboração

Entre o ecossistema SmCube.Hub da tese doutoral e o pipeline DGT7, houve uma tentativa de recomeço por um caminho diferente — mais leve, mais acessível, mais colaborativo.

A premissa era simples e ambiciosa ao mesmo tempo: se o SmCube.Hub exigia instalação local em Lazarus/Firebird e operava em máquina única, por que não reconstruir a essência do método numa plataforma que qualquer pessoa já usa, sem instalação, acessível em equipe, gratuitamente? A resposta foi o **SocioAtlas para Google Sheets** — um complemento distribuído no Google Workspace Marketplace, escrito em Google Apps Script, que transformava uma planilha comum do Google Sheets em um banco de conhecimento sistêmico multimodal.

O pipeline era elegante na concepção. O pesquisador escrevia ou colava seus dados — entrevistas transcritas, páginas web, documentos institucionais — em arquivos Google Docs. Na planilha, registrava o endereço URL de cada documento junto à sua referência bibliográfica. A partir daí, o processo de itemização acontecia diretamente no Google Docs: o pesquisador selecionava um trecho relevante, inseria um comentário com o resumo da ideia e os fatores entre colchetes — `[emprego]`, `[xenofobia]` — e o SocioAtlas fazia o resto. Com um clique em *Importar Fontes*, o sistema lia todos os documentos, extraía os itens marcados nos comentários e os organizava automaticamente na aba *Dados* da planilha. Os fatores identificados apareciam consolidados na aba *Fatores*, onde o pesquisador os renomeava, agrupava sinônimos e atribuía a cada um a modalidade correspondente. Com um segundo clique, o sistema gerava a *Matriz Multimodal* completa — todas as inter-relações possíveis entre os fatores — e produzia um gráfico interativo das conexões.

A lógica subjacente era a mesma do BDM e do SmCube.Hub: fonte → item → fator → modalidade → matriz. Mas agora o trabalho podia ser feito em equipe, em tempo real, sem servidor próprio, sem nada para instalar.

O problema revelou-se com o uso. A planilha, mesmo potencializada por scripts, é um ambiente fundamentalmente tabular — projetado para dados que cabem em linhas e colunas. O MSM exige algo diferente: anotações aninhadas, trilhas de auditoria por decisão, relações tipadas entre conceitos, hierarquias de sistemas sociais com coordenadas geográficas. Tentar acomodar tudo isso em abas de planilha gerava fricção constante. Cada nova exigência metodológica demandava gambiarras estruturais — colunas auxiliares, fórmulas frágeis, convenções de formatação que não podiam ser violadas sem quebrar o processamento. A documentação precisava alertar explicitamente: *"Não altere manualmente nenhuma informação gravada na aba Dados."* Esse aviso, por si só, resume o problema: uma ferramenta metodológica não pode ser ao mesmo tempo poderosa e quebrável.

A versão Google Sheets do SocioAtlas foi a mais acessível de todas as iterações — chegou a ser publicada no Google Workspace Marketplace e está disponível até hoje. Mas foi também a que mais expôs o limite intransponível entre um ambiente genérico de planilhas e as exigências reais de uma metodologia de pesquisa qualitativa estruturada. A colaboração foi conquistada. A profundidade, não.

Essa tensão irresolvida foi o que abriu espaço, na etapa seguinte, para uma abordagem completamente diferente: em vez de adaptar ferramentas existentes ao método, criar uma linguagem que expressasse o método diretamente.


---

# Uma Raiz Mais Antiga: O SmCube.Hub

Para entender o Synesis em sua plenitude, é preciso voltar alguns anos antes do pipeline DGT7. Em 2018, a tese de doutorado *Pensamento Sistêmico Multimodal* (UFPR) já registrava uma tentativa anterior e mais ambiciosa de resolver o mesmo problema fundamental: como organizar, de forma estruturada e replicável, os dados de uma pesquisa qualitativa sobre impactos socioambientais complexos.

O objeto de estudo naquele momento era Pontal do Paraná, uma região do litoral paranaense diretamente afetada por logísticas locais ligadas à exploração de petróleo. A pergunta de fundo era sociológica — quais fatores comprometem ou sustentam a qualidade de vida das comunidades envolvidas? — mas a resposta exigiu a construção de uma infraestrutura tecnológica própria.

O resultado foi o **SmCube.Hub**, um software desenvolvido em Free Pascal/Lazarus com banco de dados SQL Firebird, concebido como peça central de um ecossistema maior batizado de **SocioAtlas**. O software não era um produto comercial nem uma ferramenta genérica: era um CAQDAS (*Computer-Assisted Qualitative Data Analysis Software*) construído sob medida para o **Método Sistêmico Multimodal (MSM)**, uma abordagem teórica que organiza a realidade segundo as chamadas modalidades — dimensões fundamentais do ser, derivadas da filosofia de Dooyeweerd.

O fluxo de trabalho já antecipava ideias que ressurgiriam anos depois. O Zotero — gerenciador de referências bibliográficas de código aberto — era utilizado como ponto de entrada para os dados brutos: artigos, entrevistas, documentos institucionais. O SmCube.Hub então importava esse banco de dados do Zotero, reorganizando as informações segundo a lógica do MSM: referências bibliográficas tornavam-se *fontes*, marcadores tornavam-se *fatores*, notas tornavam-se *itens*. Cada item era um pequeno excerto de texto contendo uma ideia principal e relações entre fatores. Cada fator era então vinculado a uma modalidade — a dimensão filosófica que melhor o qualificava — e cada vínculo entre fatores recebia uma caracterização (positivo ou negativo) com indicadores de risco associados.

O software incluía também uma camada geográfica: os **sistemas sociais** identificados nos dados — comunidades, organizações, territórios — eram registrados com coordenadas geográficas e exportados em formato KML para o Google Earth, gerando o que a tese chamava de **Atlas Socioambiental**. A plataforma web *www.socioatlas.xyz* tornava esses mapas acessíveis ao público, completando o ecossistema com uma camada wiki colaborativa.

O paralelo com o que viria a ser o Synesis é imediato. A distinção entre fonte, item e fator está lá. A trilha de auditoria — a preocupação com a rastreabilidade de cada decisão interpretativa — está lá. A integração com o Zotero está lá. A ideia de que um ecossistema de software pode governar todo o ciclo da pesquisa qualitativa, da coleta à apresentação, está lá.

O que o SmCube.Hub não tinha era portabilidade metodológica: sua estrutura estava profundamente acoplada ao MSM e às suas dezoito modalidades. Alterar um campo, adicionar uma categoria de análise, ou adaptar o sistema para uma pesquisa com pressupostos teóricos diferentes exigiria reescrever o software. Foi exatamente esse limite — a impossibilidade de separar o método do conteúdo — que o pipeline DGT7 começou a contornar e que o Synesis resolveu de forma definitiva com o conceito de template.

O SmCube.Hub, portanto, não é um antecessor distante: é o primeiro capítulo da mesma história.

Tenho material suficiente.

---

# O Primeiro Passo: o BDM

Antes do SocioAtlas e antes do pipeline DGT7, havia uma solução ainda mais rudimentar — e, por isso mesmo, mais reveladora das origens do problema.

Em 2013, na dissertação de mestrado *Sustentabilidade e Intradisciplinaridade* (UFPR), também dedicada ao município de Pontal do Paraná e aos impactos socioambientais da indústria parapetrolífera, foi construído o primeiro protótipo desta linhagem: o **BDM — Banco de Dados Multimodal**.

O BDM era tecnicamente simples: um front-end em Microsoft Access 2010 conectado a um banco de dados PostgreSQL v.9. Sem servidor web, sem ecossistema, sem integração com ferramentas externas. Uma solução local, de uso individual, projetada para dar conta de uma necessidade metodológica imediata — organizar os dados de uma pesquisa qualitativa segundo os princípios do Pensamento Sistêmico Multimodal (PSM).

O fluxo já era o embrião do que viria depois. As **modalidades** eram cadastradas manualmente com um ID numérico que determinava sua posição na matriz multimodal. As **fontes** eram classificadas por tipo — primárias, secundárias ou referenciais — e recebiam metadados básicos como agente social, instituição e nível de percepção. Os **fatores** eram identificados e vinculados à modalidade que melhor os qualificava, com um campo de observações para registrar a trilha de raciocínio do pesquisador. E os **itens** — pequenos extratos de texto contendo uma ideia principal — eram relacionados a suas fontes e a pares de fatores com seus respectivos nexos (positivo, negativo ou neutro).

O sistema gerava automaticamente um **Sumário** consolidando todas as relações entre pares de fatores já cadastradas, e uma janela de **Diagnóstico** que apresentava lado a lado os relatos primários/secundários e os referenciais, facilitando a interpretação. Havia até uma representação gráfica automática dessas relações — um primeiro esboço do que viriam a ser os grafos de conhecimento do DGT7 e do Synesis.

O próprio autor registrou na dissertação a limitação central do BDM em relação ao SmCube de De Raadt: o BDM só permitia a identificação de **pares** de fatores por item, enquanto o SmCube admitia múltiplos fatores em itens distintos, ampliando a rede de inter-relações possíveis. Era uma restrição consciente, imposta pela simplicidade da implementação.

Essa limitação, pequena no contexto da dissertação, apontava para o problema estrutural que cada versão subsequente tentaria resolver: como representar, de forma cada vez mais rica, as relações entre conceitos extraídos de fontes heterogêneas — sem perder o rigor metodológico e sem tornar a ferramenta refém de uma única pesquisa?

O BDM foi a resposta inicial. Funcional, mas presa a um pesquisador, a uma máquina, a uma versão do Access. A pergunta que ficou em aberto moldou tudo que veio depois.

# O Arquiteto por Trás da Linguagem

Para compreender o Synesis em sua origem mais profunda, é preciso conhecer o perfil de quem o concebeu — porque o Synesis não é produto de uma única formação, mas de uma trajetória incomum que atravessa décadas, disciplinas e paradigmas.

Em 1985, aos 13 anos, Christian Maciel De Britto começou a estudar informática. Os primeiros contatos foram com Basic e noções de COBOL — e quem conhece COBOL reconhece ali uma marca que persistiria: a linguagem em blocos, com delimitadores explícitos de início e fim, estrutura que décadas mais tarde ressurgiria na sintaxe do Synesis com seus `SOURCE ... END SOURCE`, `ITEM ... END ITEM`, `ONTOLOGY ... END ONTOLOGY`.

Em 1989 veio a descoberta que moldaria os anos seguintes: o dBase II Plus e, logo depois, o Clipper — Autumn 86, Summer 87 e, finalmente, Clipper 5. Nessa linguagem, orientada a dados e a registros, foram construídos dois sistemas profissionais de envergadura real. O primeiro, voltado para gestão escolar, controlava dados acadêmicos, alunos, notas e emissão de históricos. O segundo tornou-se um negócio: o **SAGA — Sistema de Automação de Postos de Combustível**, escrito inteiramente em Clipper, que chegou a ter mais de uma centena de clientes ativos. Entre 1995 e 1997, a empresa foi incubada na **FUMSOFT**, incubadora de software de Belo Horizonte, consolidando a experiência como desenvolvedor e empreendedor de tecnologia.

Em 1999, uma virada: a atividade comercial de desenvolvimento foi encerrada. A atenção se voltou para estudos e práticas teológicas — um desvio aparente que, na perspectiva de hoje, alimentou a sensibilidade filosófica que mais tarde encontraria expressão na aplicação de Dooyeweerd ao método de pesquisa. Houve ainda um sistema em Delphi 5 para controle financeiro, desenvolvido sem fins comerciais, mantendo vivo o vínculo com a prática de programação.

De 2006 a 2019, a trajetória se consolidou nas ciências sociais e na sociologia, com foco em metodologias de pesquisa qualitativa — o mestrado, o doutorado, o MSM, o BDM, o SmCube.Hub, o SocioAtlas. Duas décadas de imersão no problema de como organizar conhecimento qualitativo de forma rigorosa, replicável e auditável.

O Synesis é o ponto onde essas duas trajetórias finalmente se encontram. A linguagem em blocos do COBOL. A orientação a dados e registros do Clipper. A arquitetura de domínio construída ao longo de anos de sistemas reais. A compreensão profunda das exigências metodológicas da pesquisa qualitativa. E, por fim, o uso de IA assistida como parceira de implementação — não para substituir o conhecimento de domínio, mas para executá-lo.

É um perfil que o campo acadêmico raramente produz: alguém que sabe o que quer construir porque passou décadas entendendo o problema pelo lado da pesquisa, e que sabe como construí-lo porque passou décadas anteriores entendendo o problema pelo lado do código. O Synesis não foi inventado. Foi destilado.