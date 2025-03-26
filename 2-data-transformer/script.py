import os
import csv
import zipfile
import pandas as pd
import pdfplumber
import re  # Importando a biblioteca de expressões regulares

def extrair_legenda(pdf_path):
    """
    Extrai automaticamente as siglas e suas descrições do rodapé do PDF.
    Retorna um dicionário com as abreviações e seus significados.
    """
    legenda = {}  # Dicionário para armazenar siglas e descrições
    padrao = re.compile(r"(\w+):\s(.+)")  # Expressão regular para encontrar "SIGLA: Descrição"
    
    with pdfplumber.open(pdf_path) as pdf:
        for page in reversed(pdf.pages):  # Começa das últimas páginas (onde a legenda geralmente está)
            text = page.extract_text()
            if text:
                for linha in text.split("\n"):
                    match = padrao.match(linha.strip())  # Verifica se a linha segue o formato "SIGLA: Descrição"
                    if match:
                        sigla, descricao = match.groups()
                        legenda[sigla] = descricao.strip()
    
    return legenda


def extrair_dados_pdf_para_csv(pdf_path, output_csv, output_zip):
    try:
        print("Iniciando extração de dados do PDF...")

        dados = []  # Lista para armazenar as linhas extraídas do PDF
        cabecalho = None  # Variável para armazenar o cabeçalho da tabela
        
        with pdfplumber.open(pdf_path) as pdf:
            for page in pdf.pages:
                table = page.extract_table()  # Extrai a tabela da página
                
                if not table:
                    continue  # Se não houver tabela na página, pula para a próxima

                for row in table:
                    # Remover espaços extras e garantir que valores vazios sejam representados corretamente
                    row = [cell.strip() if cell else "" for cell in row]
                    
                    # Se a linha estiver completamente vazia, ignora
                    if not any(row):
                        continue
                    
                    # Definir o cabeçalho se ainda não tiver sido identificado
                    if not cabecalho and any("PROCEDIMENTO" in cell for cell in row):
                        cabecalho = row  # Define a primeira linha que contém "PROCEDIMENTO" como cabeçalho
                        continue
                    
                    # Adicionar dados se o cabeçalho já foi definido
                    if cabecalho:
                        if len(row) == len(cabecalho):  # Garantir que cada linha tenha o mesmo número de colunas do cabeçalho
                            dados.append(row)

        # Criar DataFrame a partir dos dados extraídos
        df = pd.DataFrame(dados, columns=cabecalho)

        # Extrai a legenda dinamicamente
        legenda = extrair_legenda(pdf_path)
        print(f"Legenda encontrada: {legenda}")

        # Substituir as siglas nos nomes das colunas e nas células
        for coluna, descricao in legenda.items():
            # Substituir as siglas nos nomes das colunas
            if coluna in df.columns:
                df.rename(columns={coluna: descricao}, inplace=True)
            # Substituir as siglas nas células de cada coluna
            for col in df.columns:
                df[col] = df[col].replace(coluna, descricao, regex=True)
        
        # Salvar CSV com um separador adequado (ponto e vírgula para evitar que tudo fique na mesma coluna)
        df.to_csv(output_csv, index=False, encoding='utf-8-sig', sep=";", quoting=csv.QUOTE_ALL)
        print(f"Dados salvos corretamente em {output_csv}")

        # Compactar o arquivo CSV em um ZIP
        with zipfile.ZipFile(output_zip, 'w', zipfile.ZIP_DEFLATED) as zipf:
            zipf.write(output_csv, os.path.basename(output_csv))  # Garante que o arquivo dentro do ZIP não inclua o caminho completo
        
        print(f"Arquivo compactado criado: {output_zip}")
        print("Processo concluído com sucesso!")

    except Exception as e:
        print(f"Ocorreu um erro: {str(e)}")

if __name__ == "__main__":
    # Criar diretório "src" se não existir, para garantir que os arquivos sejam salvos corretamente
    os.makedirs("src", exist_ok=True)
    
    pdf_path = "../1-web-scraper/src/downloads/Anexo_I.pdf"
    output_csv = os.path.join("src", "Rol_de_Procedimentos_e_Eventos_em_Saude.csv")
    output_zip = os.path.join("src", "Teste_Murilo.zip")

    extrair_dados_pdf_para_csv(pdf_path, output_csv, output_zip)
