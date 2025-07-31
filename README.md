# Fluxo Máximo em Redes de Transporte

Este repositório apresenta o modelo matemático e a implementação computacional do **problema de Fluxo Máximo em Redes de Transporte**, desenvolvido como estudo de caso para a disciplina de Pesquisa Operacional.

## :clipboard: Descrição

O objetivo deste trabalho é modelar e resolver um problema clássico de fluxo máximo em uma rede de transporte, considerando múltiplas fábricas (fontes), depósitos (destinos) e estações intermediárias, com capacidades e custos definidos em cada arco da rede.

O modelo foi implementado na linguagem **MathProg (GMPL)** e é compatível com o **GLPK** e **GUSEK**.

---

## :books: Estrutura dos Arquivos

- `fluxo_maximo.mod` — Arquivo do modelo MathProg (GMPL), contendo toda a formulação do problema.
- `README.md` — Documentação e instruções de uso do projeto.
- _Sugestão:_ Imagens ou diagramas da rede (opcional, para melhor visualização).

---

## :rocket: Como Executar

### Usando o GUSEK (Windows)

1. **Baixe e instale o GUSEK:**  
   [http://gusek.sourceforge.net/](http://gusek.sourceforge.net/)

2. **Abra o arquivo** `fluxo_maximo.mod` no GUSEK.

3. **Execute o modelo:**  
   Clique no botão "Run" (ícone de “play” ou tecla F5).

4. **Confira os resultados:**  
   Os resultados aparecem no console inferior do GUSEK.

### Usando o GLPK (Linux/Windows)

1. Instale o GLPK (em Linux: `sudo apt install glpk-utils`)
2. Execute no terminal:
   ```sh
   glpsol --math fluxo_maximo.mod
