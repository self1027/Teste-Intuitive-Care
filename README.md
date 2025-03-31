Entendido! Vou reformular o `README.md` para incluir um arquivo `requirements.txt` para cada pasta relevante (1-web-scraper, 2-data-transformer e API). Cada um terá as dependências específicas para funcionar corretamente. A seguir está o novo `README.md`.

---

# Teste Intuitive Care

Este repositório contém um projeto organizado em quatro partes principais: um web scraper, um transformador de dados, um banco de dados e uma API. O objetivo é coletar, processar e armazenar dados para análise.

---

## ⚡ Estrutura do Projeto

```
/
|-- 1-web-scraper/            # Raspagem de dados
|   |-- script.py             # Script para coletar dados da web
|   |-- requirements.txt      # Dependências para o Web Scraper
|
|-- 2-data-transformer/       # Processamento dos dados coletados
|   |-- script.py             # Script para transformar os dados
|   |-- requirements.txt      # Dependências para o Data Transformer
|
|-- 3-db/                     # Banco de dados
|   |-- 1-create_database.sql  # Cria o banco de dados
|   |-- 2-create_tables.sql    # Cria as tabelas necessárias
|   |-- 3-load_data.sql        # Carrega os dados no banco
|   |-- 4-analysis_queries.sql # Consultas para análise
|
|-- 4-api/                    # API para interação com o banco de dados
|   |-- app.py                # Código da API
|   |-- requirements.txt      # Dependências para a API
|
|-- .gitignore                # Arquivos ignorados pelo Git
|-- README.md                 # Documentação do projeto
```

---

## 🔧 Configuração e Execução

### 1. Web Scraper
O script de raspagem de dados está localizado em `1-web-scraper/script.py`.

**Dependências para o Web Scraper:**
- Para instalar as dependências necessárias, execute:
```bash
cd 1-web-scraper
pip install -r requirements.txt
```

**Para executá-lo:**
```bash
python script.py
```

Este script acessa um site, encontra os links dos anexos, baixa e os compacta em um arquivo ZIP.

---

### 2. Transformação de Dados
Após a coleta, os dados precisam ser transformados. Execute o script em `2-data-transformer/script.py`.

**Dependências para o Data Transformer:**
- Para instalar as dependências necessárias, execute:
```bash
cd 2-data-transformer
pip install -r requirements.txt
```

**Para executar:**
```bash
python script.py
```

Este script processa os dados extraídos dos PDFs e gera um CSV com as informações.

---

### 3. Banco de Dados
Os scripts SQL na pasta `3-db/` devem ser executados em sequência para configurar o banco de dados e carregar os dados.

#### **Passos:**
1. Entrar na pasta:
   ```bash
   cd 3-db
   ```
2. Iniciar o MySQL localmente:
   ```bash
   mysql -u root -p
   ```
3. Criar o banco de dados:
   ```bash
   SOURCE C:/caminho/para/seu/arquivo/1-create_database.sql;
   ```
4. Criar as tabelas:
   ```bash
   SOURCE C:/caminho/para/seu/arquivo/2-create_tables.sql;
   ```
5. Carregar os dados:
   ```bash
   SOURCE C:/caminho/para/seu/arquivo/3-load_data.sql;
   ```
6. Executar consultas analíticas:
   ```bash
   SOURCE C:/caminho/para/seu/arquivo/4-analysis_queries.sql;
   ```

---

### 4. API

A API permite a interação com o banco de dados, proporcionando funcionalidades como a busca de operadoras no banco de dados.

**Dependências para a API:**
- Para instalar as dependências necessárias, execute:
```bash
cd 4-api
pip install -r requirements.txt
```

**Para executar:**
```bash
python app.py
```

Esta API está configurada para executar localmente na porta `8080`. Ela inclui um endpoint de busca (`/search`) que permite consultar dados das operadoras no banco de dados.

---

## ⚠ Possíveis Erros

- **Erro de permissão ao carregar CSV no MySQL**: O MySQL pode requerer que os arquivos CSV estejam em um diretório específico. Se ocorrer um erro, execute o comando abaixo e mova os diretórios para onde o SQL responder.
  ```bash
  SELECT @@global.secure_file_priv;
  ```
  Outra forma de resolver é adicionando no arquivo de configuração do MySQL (`my.cnf` no Linux/macOS ou `my.ini` no Windows), na seção `[mysqld]`:
  ```bash
  secure_file_priv =
  ```

- **Erro de autenticação**: Verifique se o usuário e senha estão corretos.
- **Erro de banco de dados inexistente**: Certifique-se de que o banco de dados foi criado antes de tentar carregar os dados.

---

## ✅ Requisitos

Antes de rodar os scripts, você precisará instalar as dependências. Para facilitar, temos arquivos `requirements.txt` nas pastas de cada módulo. Para instalar as dependências, execute:

1. Para o Web Scraper:
   ```bash
   cd 1-web-scraper
   pip install -r requirements.txt
   ```
   
2. Para o Data Transformer:
   ```bash
   cd 2-data-transformer
   pip install -r requirements.txt
   ```

3. Para a API:
   ```bash
   cd 4-api
   pip install -r requirements.txt
   ```

- Python 3+
- MySQL
- Bibliotecas adicionais conforme especificado em `requirements.txt`

---

## 👥 Contato
Caso tenha dúvidas ou sugestões, entre em contato com o desenvolvedor.

---
