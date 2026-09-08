
# 🛒 NovaMarket - E-commerce Database & SQL Analytics  🛢

[![MySQL](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql&logoColor=white)](#)
[![SQL](https://img.shields.io/badge/Language-SQL-orange?logo=mysql&logoColor=white)](#)
[![Docker](https://img.shields.io/badge/Container-Docker-2496ED?logo=docker&logoColor=white)](#)
[![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-brightgreen)](#)

Projeto de modelagem, automação e análise de dados relacionais para um e-commerce fictício chamado **NovaMarket**. 

Desenvolvido para aplicar na prática **DDL, DML, Stored Procedures, Triggers**, regras de CRM e consultas analíticas voltadas para Inteligência de Negócios (BI).

---

## 🎯 Objetivos do Projeto

- 🏗️ **Modelagem Relacional:** Estruturação de tabelas para clientes, produtos, vendedores, pedidos, itens e histórico de CRM.
- ⚡ **Automação com Stored Procedures:** Rotina em MySQL (`sp_fechamento_diario`) para processamento de pedidos e atualização da régua de relacionamento de clientes.
- 📊 **Inteligência de Negócios:** Construção de queries para acompanhamento de ticket médio, faturamento regional e desempenho comercial.

---

## 🛠️ Tecnologias e Ferramentas

- **SGBD:** MySQL
- **Containers:** Docker & Docker Compose
- **IDE / Cliente SQL:** VS Code / DBeaver
- **Modelagem Visual:** Draw.io
- **Versionamento:** Git & GitHub

---

## 📂 Estrutura do Repositório

```text
NovaMarket_Analytics/
├── database/
│   ├── create_table.sql        # DDL: Criação das tabelas e chaves relacionais
│   ├── insert_dados.sql        # DML: Carga de dados de teste (Seed Data)
│   └── trigger_procedure.sql   # Automações: Triggers e Stored Procedures
├── diagrama/
│   ├── draw.diagram.drawio.png # Diagrama ER / Modelo Relacional
│   └── fluxo_novamarket.jpg    # Fluxo visual do processo de dados
├── docs/
│   ├── 01_requisitos.md        # Levantamento de Requisitos e Regras de Negócio
│   ├── 02_modelagem.md         # Documentação da modelagem de dados
│   ├── 03_indicadores.md        # Definição das métricas e KPIs de BI
│   └── triggers_procedure.md   # Documentação técnica das automações
├── queries/                    # Consultas SQL e Views Analíticas
├── docker-compose.yml          # Subida rápida do ambiente MySQL via container
└── README.md                   # Documentação principal do projeto
