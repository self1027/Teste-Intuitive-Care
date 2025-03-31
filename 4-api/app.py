from flask import Flask, request, jsonify
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Permite requisições CORS, útil para testes com frontend

# Carregar o arquivo CSV para o servidor
df = pd.read_csv('../3-db/src/Relatorio_cadop.csv', delimiter=';')


# Adiciona o print antes de qualquer requisição
@app.before_request
def log_request():
    print(f"Requisição recebida: {request.method} {request.url}")
    print(f"Parâmetros da requisição: {request.args}")

@app.route('/search', methods=['GET'])
def search_operadoras():
    # Receber a query de busca
    query = request.args.get('query', '')
    
    # Se a query não for fornecida, retorna todos os registros
    if not query:
        return jsonify(df.to_dict(orient='records'))
    
    # Filtrar os registros que contêm a query no nome ou registro_ans
    filtered_df = df[df['Razao_Social'].str.contains(query, case=False, na=False) | 
                     df['Nome_Fantasia'].str.contains(query, case=False, na=False) |
                     df['Registro_ANS'].astype(str).str.contains(query, case=False, na=False)]
    
    # Retornar os resultados como JSON
    return jsonify(filtered_df.to_dict(orient='records'))

if __name__ == '__main__':
    app.run(debug=True, port=8080)
