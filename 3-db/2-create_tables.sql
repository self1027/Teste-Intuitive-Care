-- Seleciona o banco de dados
USE ans_dados;

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
