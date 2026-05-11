Synesis - AGU

# O que é a linguagem Synesis, e seu ecosistema?

Público: Direito



O conhecimento humano é naturalmente intrincado, repleto de nuances e conexões profundas. Ao longo do seu trabalho, profissionais do direito acumulam análises contratuais, pareceres lidos e comentados, jurisprudências, anotações de reuniões e registros de audiências — além de uma infinidade de conhecimento de natureza qualitativa que raramente encontra forma organizada.

Synesis é uma linguagem computacional de domínio específico (Domain-Specific Language — DSL). Profissionais do direito já convivem com um tipo semelhante de linguagem: é o caso do Latim Jurídico, que apresenta expressões não utilizadas no idioma cotidiano, mas que possui rico vocabulário especializado, com regras próprias de uso, que qualquer jurista compreende com exatidão. Synesis cumpre papel análogo para o conhecimento de natureza textual: possui uma gramática reconhecida tanto por humanos quanto por computadores. Ela impõe estrutura sobre as anotações, de modo que o computador consiga verificar automaticamente se estão em conformidade com um contrato pré-estabelecido — o template. Esse template é flexível o suficiente para atender a diversas configurações, definidas conforme aplicações específicas. Um advogado pode criar uma configuração para organizar seus processos e documentos, classificá-los em categorias e estabelecer conexões explícitas entre elas. Em um banco de processos, por exemplo, é possível identificar temas, conceitos recorrentes e relações entre partes envolvidas. Synesis permite registrar não apenas "o quê" — um fato, um argumento, uma posição doutrinária —, mas também "por quê" e "como isso se conecta a outras coisas". Um profissional do direito pode documentar, por exemplo, que a ausência de boa-fé objetiva numa relação contratual tende a comprometer a execução do contrato — e vincular essa interpretação diretamente ao trecho do contrato que a sustenta, ao artigo doutrinário que a embasou e ao precedente jurisprudencial que a confirma. Essa teia de relações causais e conceituais, antes dispersa em múltiplos documentos e na memória do profissional, passa a existir de forma explícita, verificável e compartilhável.

O ecossistema Synesis é o conjunto de ferramentas que torna esse processo prático: um editor que valida se a estrutura está correta, mecanismos de exportação que convertem o conhecimento acumulado em formatos utilizáveis por plataformas de ciências de dados, e integração com inteligência artificial que permite gerar anotações automaticamente, além de consultar e navegar esse acervo de forma inteligente e com o uso de linguagem natural. Para um escritório de advocacia, isso significa que o conhecimento construído por um sócio experiente não fica preso na sua cabeça ou perdido em arquivos desorganizados — ele se torna patrimônio institucional, auditável e evolutivo, uma vez que Synesis também registra as anotações em formato de texto comum e acessível, não em uma caixa preta.



O exemplo abaixo parte de um acórdão do STJ sobre direito à privacidade. Três blocos compõem a estrutura completa de uma anotação em Synesis.

---

**Bloco 1 — SOURCE**: registra a origem do documento com todos os seus metadados. O compilador exige que cada anotação seja rastreável até uma fonte identificada.

```synesis
SOURCE @stj_peticao_1234
    access_date: 2026-02-17
    document_type: ACORDAO
    tribunal: STJ
    numero_processo: 1234/2025
    relator: Min. Fulano de Tal
    data_julgamento: 2025-11-10
    data_publicacao: 2025-11-20
    orgao_julgador: Terceira Turma
    resultado: PROVIDO
    url: https://processo.stj.jus.br/processo/pesquisa/?tipoPesquisa=tipoPesquisaNumeroRegistro&termo=1234
END SOURCE
```

---

**Bloco 2 — ITEM**: registra o trecho relevante extraído da fonte, a interpretação do profissional e a conexão com outros conceitos. O campo `chain` expressa a relação entre conceitos: neste caso, que o direito à privacidade prevalece sobre a exposição não autorizada.

```synesis
ITEM @stj_peticao_1234
    locus: CF/88 Art. 5, inc. X
    quote: "são invioláveis a intimidade, a vida privada, a honra e a imagem das pessoas"
    note: O dispositivo consagra o direito à privacidade como direito fundamental absoluto, fundamento ratio decidendi da decisão recorrida.
    chain: Direito_a_Privacidade -> OVERRULES -> Exposicao_Nao_Autorizada
END ITEM
```

---

**Bloco 3 — ONTOLOGY**: define o conceito utilizado na anotação. É o vocabulário controlado do projeto — garante que todos os membros da equipe usem os mesmos termos com o mesmo significado.

```synesis
ONTOLOGY Direito_a_Privacidade
    topic: Direitos_da_Personalidade
    description: Direito subjetivo fundamental que assegura ao indivíduo o controle sobre sua esfera íntima, dados pessoais e vida privada, vedando interferências não consentidas de terceiros ou do Estado. Fundamento: CF/88, art. 5º, inc. X; CC, art. 21; LGPD, art. 2º, I.
END ONTOLOGY
```

---

**Template — contrato que governa toda a análise**

O template define quais campos são obrigatórios, quais são opcionais e quais valores são aceitos. É ele que permite ao compilador validar automaticamente cada anotação.



```synesis
TEMPLATE jurisprudencia_privacidade version: "1.0"

SOURCE FIELDS
    REQUIRED document_type, tribunal, numero_processo,
             data_julgamento, resultado
    OPTIONAL relator, orgao_julgador, data_publicacao, url
END SOURCE FIELDS

ITEM FIELDS
    REQUIRED locus, quote, note
    OPTIONAL chain
END ITEM FIELDS

ONTOLOGY FIELDS
    REQUIRED description
    OPTIONAL topic
END ONTOLOGY FIELDS

FIELD document_type TYPE ENUMERATED
    SCOPE SOURCE
    VALUES
        ACORDAO:  Acórdão de tribunal
        SENTENCA: Sentença de primeiro grau
        PARECER:  Parecer jurídico
        LEI:      Texto normativo
    END VALUES
END FIELD

FIELD resultado TYPE ENUMERATED
    SCOPE SOURCE
    VALUES
        PROVIDO:         Recurso provido
        IMPROVIDO:       Recurso improvido
        PARCIAL:         Provimento parcial
        NAO_CONHECIDO:   Recurso não conhecido
    END VALUES
END FIELD

FIELD chain TYPE CHAIN
    SCOPE ITEM
    RELATIONS
        OVERRULES:        Tese prevalece sobre entendimento anterior
        CITES_PRECEDENT:  Decisão fundamentada em caso anterior
        DISTINGUISHES:    Caso atual distinguido da regra geral
    END RELATIONS
END FIELD
```



Este é apenas um exemplo entre inúmeras configurações possíveis. Um advogado trabalhista pode estruturar sua base de jurisprudência de forma completamente diferente. Um departamento jurídico corporativo pode criar um template para gestão de contratos, outro para monitoramento regulatório e outro para registro de pareceres internos. Um pesquisador de direito pode mapear a evolução doutrinária de um conceito ao longo de décadas.

A gramática é a mesma. O que muda é o que cada profissional decide construir dentro dela.
