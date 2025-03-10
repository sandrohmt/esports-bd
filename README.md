# Banco de Dados de Campeonatos de Esportes Eletrônicos
Este repositório contém o projeto de banco de dados desenvolvido para o trabalho acadêmico, que aborda o tema de Campeonatos de Esportes Eletrônicos. O objetivo do trabalho foi criar um banco de dados completo e otimizado, contendo as principais informações sobre torneios, equipes, jogadores, partidas, transmissões, rankings e eventos relacionados aos campeonatos de eSports.

## Estrutura do Projeto
O banco de dados foi implementado no MySQL e contém as seguintes partes:

## 1. Modelo Conceitual
O modelo conceitual foi criado para representar de forma clara as entidades e seus relacionamentos no contexto dos campeonatos de eSports. Ele descreve a estrutura do banco de dados, incluindo os principais aspectos e interações entre as diferentes partes envolvidas no ambiente de eSports.

## 2. Esquema Relacional
O esquema relacional foi implementado no MySQL, com o uso de tabelas, chaves primárias e estrangeiras, e normalização para garantir a integridade dos dados. O banco de dados contém 15 tabelas, com dados que representam diversos aspectos dos campeonatos de eSports.

## 3. Stored Procedures e Funções
Implementação de 5 stored procedures/funções para automação de tarefas e cálculos, como a criação de partidas, cálculo de pontos no ranking, e outras operações relacionadas ao torneio.

## 4. Triggers
O banco de dados inclui 2 triggers para garantir a integridade e automação de processos, como a atualização de rankings após a conclusão de partidas ou a inserção de novos jogadores em uma equipe.

## 5. Visões
Foram implementadas 2 visões para simplificar consultas frequentes e fornecer uma visão consolidada de dados importantes, como estatísticas de torneios e rankings de jogadores.

## 6. Consultas
Foram propostas 10 consultas SQL, que vão além do simples SELECT *. As consultas incluem buscas complexas e análise de dados sobre jogos, jogadores, partidas e classificações.

## 7. Índices
Índices foram implementados nas tabelas mais consultadas para otimizar a performance das consultas, especialmente aquelas que envolvem rankings, jogadores e partidas.

## Tabelas Principais
O banco de dados inclui as seguintes tabelas principais:

- **Time:** Representa os times participantes dos campeonatos.
- **Jogador:** Representa os jogadores, incluindo informações como nome, idade e equipamentos.
- **Torneio:** Detalhes sobre os torneios, como nome, local, premiação e vencedor.
- **Evento:** Representa eventos de esportes eletrônicos, que podem incluir torneios.
- **Transmissão:** Informações sobre a transmissão dos eventos, como canal e comentaristas.
- **Jogo:** Representa os jogos nos quais os torneios estão baseados, com detalhes sobre o gênero e desenvolvedora.
- **Partida:** Detalhes das partidas realizadas entre times e jogadores.
- **Ranking:** Informações sobre a classificação dos jogadores e times nos torneios.
  
## Contribuições
Contribuições são bem-vindas! Se você tiver sugestões de melhorias ou correções, fique à vontade para fazer um fork do repositório e enviar um pull request.

