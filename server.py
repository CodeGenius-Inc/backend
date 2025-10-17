from flask import Flask, request, jsonify
import psycopg2
app = Flask(__name__)
port = 5000

connection = psycopg2.connect(
    dbname="postgres", # Nombre base de datos
    user="postgres", # Usuario base de datos
    password="123456", # Password base de datos
    host="localhost", # Ubicación base de datos
)

@app.route('/')
def hello_world():
    return 'Hello world!'

@app.route('/register', methods=['POST'])
def register():
    cursor = connection.cursor()
    try:
        # "insert into cliente (nombre, direccion, telefono) values ('Diego', 'Chile', 1290129)" 
        return jsonify({'message': 'Usuario registrado correctamente'}), 201
    except Exception as e:
        return jsonify({'message': 'Error interno del servidor', 'error': str(e)}), 500
    finally:
        cursor.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=port)