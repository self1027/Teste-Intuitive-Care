import os
import requests
import zipfile
from bs4 import BeautifulSoup

def acessar_site_download_compactar():
    # 1.1 Acesso ao site
    url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
    
    try:
        print("Acessando o site...")
        response = requests.get(url)
        response.raise_for_status()
        
        # 1.2 Encontrar links para os Anexos I e II em PDF
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Mapeamento dos anexos que queremos baixar
        anexos_alvo = {
            'Anexo I': 'Anexo_I.pdf',
            'Anexo II': 'Anexo_II.pdf'
        }
        
        anexos_encontrados = {}
        
        # Buscar todos os links da página
        for link in soup.find_all('a', href=True):
            href = link['href']
            text = link.text.strip()
            
            # Verificar cada anexo que estamos procurando
            for anexo_text, anexo_nome in anexos_alvo.items():
                if anexo_text in text and href.lower().endswith('.pdf'):
                    if anexo_text not in anexos_encontrados:
                        anexos_encontrados[anexo_text] = (anexo_nome, href)
        
        if len(anexos_encontrados) != 2:
            print("Anexos encontrados:", anexos_encontrados)
            raise Exception("Não foi possível encontrar ambos os anexos no site.")
        
        # Criar diretório para os downloads
        os.makedirs('src/downloads', exist_ok=True)
        
        # Baixar os arquivos
        arquivos_baixados = []
        for anexo_text, (nome_arquivo, url_download) in anexos_encontrados.items():
            caminho_arquivo = os.path.join('src/downloads', nome_arquivo)
            print(f"Baixando {nome_arquivo} de {url_download}...")
            
            response = requests.get(url_download, stream=True)
            response.raise_for_status()
            
            with open(caminho_arquivo, 'wb') as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            
            arquivos_baixados.append(caminho_arquivo)
            print(f"{nome_arquivo} baixado com sucesso!")
        
        # 1.3 Compactar os arquivos
        os.makedirs("src", exist_ok=True)
        
        nome_zip = os.path.join("src", "Anexos_ANS.zip")
        print(f"Criando arquivo compactado {nome_zip}...")
        
        with zipfile.ZipFile(nome_zip, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for arquivo in arquivos_baixados:
                zipf.write(arquivo, os.path.basename(arquivo))
        
        print(f"Arquivo {nome_zip} criado com sucesso!")
        print("Processo concluído.")
        
    except Exception as e:
        print(f"Ocorreu um erro: {str(e)}")

if __name__ == "__main__":
    acessar_site_download_compactar()