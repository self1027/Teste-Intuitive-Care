-- Configurações iniciais
SET FOREIGN_KEY_CHECKS = 0;
SET GLOBAL local_infile = 1;

-- Seleciona o banco de dados
USE ans_dados;

-- Limpeza das tabelas
DROP TABLE IF EXISTS demonstracoes_contabeis;
DROP TABLE IF EXISTS operadoras;

-- Criação da tabela operadoras
CREATE TABLE operadoras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    registro_ans VARCHAR(20) UNIQUE NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    modalidade VARCHAR(100),
    uf VARCHAR(2),
    municipio VARCHAR(100),
    data_registro DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Criação da tabela demonstracoes_contabeis
CREATE TABLE demonstracoes_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    registro_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    vl_saldo_inicial DECIMAL(18,2) NOT NULL,
    vl_saldo_final DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (registro_ans) REFERENCES operadoras(registro_ans)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(registro_ans, cnpj, razao_social, modalidade, uf, municipio, @data_registro)
SET data_registro = STR_TO_DATE(@data_registro, '%d/%m/%Y');

-- Importação direta das demonstrações contábeis (arquivo por arquivo)
-- 1T2023
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- 2T2023
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- 3T2023
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- 4T2023
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- 1T2024
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- 2T2024
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- 3T2024
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- 4T2024
LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = CAST(REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.') AS DECIMAL(18,2)),
    vl_saldo_final = CAST(REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.') AS DECIMAL(18,2));

-- Ativa verificação de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;
