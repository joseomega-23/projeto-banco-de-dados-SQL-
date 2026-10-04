
CREATE TABLE IF NOT EXISTS cliente (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    id_responsavel INTEGER,
    FOREIGN KEY (id_responsavel) REFERENCES cliente(id)
);

CREATE TABLE IF NOT EXISTS conta (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    tipo TEXT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE IF NOT EXISTS transacao (
    id INTEGER PRIMARY KEY,
    conta_id INTEGER,
    tipo TEXT CHECK(tipo IN ('DEPOSITO', 'SAQUE', 'PAGAMENTO')),
    valor REAL NOT NULL,
    FOREIGN KEY (conta_id) REFERENCES conta(id)
);


INSERT INTO cliente (id, nome, id_responsavel) VALUES
(1, 'Carlos Silva', NULL),
(2, 'João Silva', 1),
(3, 'Maria Oliveira', NULL),
(4, 'Ana Oliveira', 3),
(5, 'Roberto Santos', NULL),
(6, 'Lucas Santos', 5);

INSERT INTO conta (id, cliente_id, tipo) VALUES
(101, 1, 'CORRENTE'),
(102, 2, 'POUPANCA'),
(103, 3, 'CORRENTE'),
(104, 4, 'CORRENTE'),
(105, 5, 'POUPANCA'),
(106, 6, 'CORRENTE');

INSERT INTO transacao (id, conta_id, tipo, valor) VALUES
(1, 101, 'DEPOSITO', 2000),
(2, 101, 'SAQUE', 500),
(3, 102, 'DEPOSITO', 2500),
(4, 102, 'PAGAMENTO', 300),
(5, 103, 'DEPOSITO', 1000),
(6, 103, 'SAQUE', 300),
(7, 104, 'DEPOSITO', 2000),
(8, 104, 'PAGAMENTO', 250),
(9, 105, 'DEPOSITO', 1200),
(10, 106, 'DEPOSITO', 600);
