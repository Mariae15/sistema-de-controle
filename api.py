from flask import Flask, jsonify
import mysql.connector
import json

app = Flask(__name__)

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'ComercioLocal'
}

@app.route('/dados/estoque_baixo', methods=['GET'])
def estoque_baixo():
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT nome, estoque, estoque_minimo 
        FROM Produtos 
        WHERE estoque < estoque_minimo
    """)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(result)

@app.route('/dados/vendas_diarias', methods=['GET'])
def vendas_diarias():
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT data_venda, SUM(valor_total) as total_dia
        FROM Vendas
        GROUP BY data_venda
        ORDER BY data_venda
    """)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(result)

@app.route('/dados/produtos_mais_vendidos', methods=['GET'])
def produtos_mais_vendidos():
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT p.nome, SUM(iv.quantidade) as total_vendido
        FROM Itens_Venda iv
        JOIN Produtos p ON iv.produto_id = p.id
        GROUP BY p.nome
        ORDER BY total_vendido DESC
    """)
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
