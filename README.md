# Teste Intuitive Care

Este repositório contém um projeto organizado em quatro partes principais: um web scraper, um transformador de dados, um banco de dados e uma API. O objetivo é coletar, processar e armazenar dados para análise.

---

## ⚡ Estrutura do Projeto

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

---

## 🔧 Configuração e Execução

### 1. Web Scraper
O script de raspagem de dados está localizado em `1-web-scraper/script.py`.

**Para executá-lo:**
```bash
cd 1-web-scraper
python script.py
```
Certifique-se de ter as dependências instaladas antes de rodar o script.

---

### 2. Transformação de Dados
Após a coleta, os dados precisam ser transformados. Execute o script em `2-data-transformer/script.py`.

**Para executar:**
```bash
cd 2-data-transformer
python script.py
```

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

## ⚠ Possíveis Erros no MySQL

- **Erro de permissão ao carregar CSV**: O MySQL pode requerer que os arquivos CSV estejam em um diretório específico. Se ocorrer um erro, execute o comando abaixo e mova os diretórios para onde o SQL responder.
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

- Python 3+
- MySQL
- Bibliotecas adicionais (se necessário, especificadas no script)

---

## 👥 Contato
Caso tenha dúvidas ou sugestões, entre em contato com o desenvolvedor.

