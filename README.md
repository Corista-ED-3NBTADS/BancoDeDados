# 🎵 Sistema de Gerenciamento de Coral (Database)

Este repositório contém a estrutura de banco de dados para um sistema de gestão de corais e orquestras. O sistema permite o controle de membros (coristas e músicos), agendamento de apresentações e controle de presença.

## 📋 Funcionalidades

* **Autenticação**: Tabela de usuários para login no sistema.
* **Gestão de Membros**: Cadastro separado para Coristas (com tipo de voz) e Músicos (com instrumento).
* **Agenda**: Criação de eventos e apresentações com data e local.
* **Controle de Escala**: Definição de quem participará de cada evento (`participantes_evento`).
* **Controle de Presença**: Registro efetivo de quem compareceu aos eventos (`presencas`).

## 🛠️ Tecnologias Utilizadas

* **MySQL / MariaDB**: Sistema de Gerenciamento de Banco de Dados Relacional.
* **SQL Standard**: Scripts compatíveis com a maioria dos bancos SQL baseados em MySQL.

## 🚀 Como Executar

### Pré-requisitos

* Ter o MySQL Server ou MariaDB instalado.
* Uma ferramenta de cliente SQL (ex: MySQL Workbench, DBeaver, HeidiSQL) ou acesso via terminal.

### Instalação

1.  Clone este repositório ou baixe o arquivo `Data.sql`.
2.  Abra sua ferramenta de banco de dados.
3.  Execute o script `Data.sql`.

O script irá automaticamente:
1.  Criar o banco de dados `coral` (se não existir).
2.  Criar todas as tabelas necessárias.
3.  Inserir um usuário administrador padrão.

### 👤 Usuário Padrão

Após a execução do script, um usuário administrativo será criado automaticamente para acesso inicial:

| Campo | Valor |
| :--- | :--- |
| **Username** | `admin` |
| **Password** | `admin123` |
