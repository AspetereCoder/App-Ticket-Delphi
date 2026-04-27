import sqlite3
import os

def create_database():
    db_name = 'banco_dados.db'
    
    # Se o arquivo já existir, ele não será sobrescrito, apenas garantirá as tabelas
    # Se quiser começar do zero, descomente a linha abaixo:
    # if os.path.exists(db_name): os.remove(db_name)

    print(f"Criando/Conectando ao banco: {db_name}...")
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    # Criar Tabela Funcionario
    print("Criando tabela 'funcionario'...")
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS funcionario (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            cpf TEXT,
            cargo TEXT,
            genero TEXT,
            dataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
            qtdTickets INTEGER DEFAULT 0
        )
    ''')

    # Criar Tabela Ticket
    print("Criando tabela 'ticket'...")
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS ticket (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            funcionarioId INTEGER NOT NULL,
            qtd INTEGER DEFAULT 1,
            dataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (funcionarioId) REFERENCES funcionario(id) ON DELETE CASCADE
        )
    ''')

    conn.commit()
    conn.close()
    print("Processo finalizado com sucesso!")

if __name__ == "__main__":
    create_database()
