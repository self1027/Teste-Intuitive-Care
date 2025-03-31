# Teste Intuitive Care

Este repositório contém um projeto organizado em quatro partes principais: Um web scraper, um transformador de dados e um banco de dados. O objetivo é coletar, processar e armazenar dados para análise.

## Estrutura do Projeto

```
/
|-- 1-web-scraper/            # Raspagem de dados
|   |-- script.py             # Script para coletar dados da web
|
|-- 2-data-transformer/       # Processamento dos dados coletados
|   |-- script.py             # Script para transformar os dados
|
|-- 3-db/                     # Banco de dados
|   |-- 1-create_database.sql  # Cria o banco de dados
|   |-- 2-create_tables.sql    # Cria as tabelas necessárias
|   |-- 3-load_data.sql        # Carrega os dados no banco
|   |-- 4-analysis_queries.sql # Consultas para análise
|
|-- .gitignore                # Arquivos ignorados pelo Git
|-- README.md                 # Documentação do projeto
```

## Configuração e Execução

### 1. Web Scraper

O script de raspagem de dados está localizado em `1-web-scraper/script.py`.

**Para executá-lo:**
```bash
cd 1-web-scraper
python script.py
```

Certifique-se de ter as dependências instaladas antes de rodar o script.

### 2. Transformação de Dados

Após a coleta, os dados precisam ser transformados. Execute o script em `2-data-transformer/script.py`.

**Para executar:**
```bash
cd 2-data-transformer
python script.py
```

### 3. Banco de Dados

Os scripts SQL na pasta `3-db/` devem ser executados em sequência para configurar o banco de dados e carregar os dados.

**Passos:**
1. Criar o banco de dados:
   ```bash
   mysql -u usuario -p < 3-db/1-create_database.sql
   ```
2. Criar as tabelas:
   ```bash
   mysql -u usuario -p nome_do_banco < 3-db/2-create_tables.sql
   ```
3. Carregar os dados:
   ```bash
   mysql -u usuario -p nome_do_banco < 3-db/3-load_data.sql
   ```
4. Executar consultas analíticas:
   ```bash
   mysql -u usuario -p nome_do_banco < 3-db/4-analysis_queries.sql
   ```

### Possíveis Erros no MySQL

- **Erro de permissão ao carregar CSV**: O MySQL pode requerer que os arquivos CSV estejam em um diretório específico. Se ocorrer um erro, mova os arquivos para `/var/lib/mysql-files/` e tente novamente.
- **Erro de autenticação**: Verifique se o usuário e senha estão corretos.
- **Erro de banco de dados inexistente**: Certifique-se de que o banco de dados foi criado antes de tentar carregar os dados.

## Requisitos

- Python 3+
- MySQL
- Bibliotecas adicionais (se necessário, especificadas no script)

## Contato
Caso tenha dúvidas ou sugestões, entre em contato com o desenvolvedor.

---
