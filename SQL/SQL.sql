CREATE TABLE Cliente (
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) PRIMARY KEY,
    Email VARCHAR(50) UNIQUE NOT NULL,
    Telefone VARCHAR(15) UNIQUE NOT NULL,
    Endereco VARCHAR(100) UNIQUE NOT NULL,
    Idade INT NOT NULL
);


CREATE TABLE Aluguel (
      Codigo_aluguel INT PRIMARY KEY,
      Data_inicio DATE NOT NULL,
      Data_fim DATE NOT NULL,
      Quilometragem_inicial DECIMAL (10,5) NOT NULL,
      Quilometragem_final DECIMAL (10,5) NOT NULL,
      Status_aluguel VARCHAR (20) NOT NULL,
      Valor_total DECIMAL (10,5) NOT NULL,
      fk_Cliente_CPF VARCHAR(11),
      FOREIGN KEY (fk_Cliente_CPF) REFERENCES Cliente(CPF)
);


CREATE TABLE Pagamento (
      Codigo_pagamento INT PRIMARY KEY AUTO_INCREMENT,
      Data_pagamento DATE NOT NULL,
      Valor_total DECIMAL (10,5) NOT NULL,
      Forma_de_pagamento  VARCHAR(15) NOT NULL,
      Tipo_de_aluguel  VARCHAR(50) NOT NULL,
      Seguro_incluso VARCHAR(11) NOT NULL
);

CREATE TABLE Veiculos (
    Placa VARCHAR(7) PRIMARY KEY,
    Modelo VARCHAR(50) NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Ano YEAR NOT NULL,
    Valor_da_diaria DECIMAL(10,2) NOT NULL,
    Status_veiculos VARCHAR(30) NOT NULL
);

CREATE TABLE Manutencao (
      Codigo_manutencao INT PRIMARY KEY AUTO_INCREMENT,
      Data_manutencao DATE NOT NULL,
      Descricao  VARCHAR (100) NOT NULL,
      Tipo_manutencao VARCHAR(100) NOT NULL,
      Custo DECIMAL (10,5) NOT NULL, 
      Responsavel VARCHAR (30) NOT NULL
);


CREATE TABLE Realiza (
    fk_Aluguel_Codigo_aluguel INT,
    fk_Pagamento_Codigo_pagamento INT,
    PRIMARY KEY (fk_Aluguel_Codigo_aluguel, fk_Pagamento_Codigo_pagamento),
    FOREIGN KEY (fk_Aluguel_Codigo_aluguel) REFERENCES Aluguel(Codigo_aluguel),
    FOREIGN KEY (fk_Pagamento_Codigo_pagamento) REFERENCES Pagamento(Codigo_pagamento)
);

CREATE TABLE Contem (
    fk_Manutencao_Codigo_manutencao INT,
    fk_Veiculos_Placa VARCHAR(7),
    PRIMARY KEY (fk_Manutencao_Codigo_manutencao, fk_Veiculos_Placa),
    FOREIGN KEY (fk_Manutencao_Codigo_manutencao) REFERENCES Manutencao(Codigo_manutencao),
    FOREIGN KEY (fk_Veiculos_Placa) REFERENCES Veiculos(Placa)
);

CREATE TABLE Compra (
    fk_Pagamento_Codigo_pagamento INT,
    fk_Veiculos_Placa VARCHAR(7),
    PRIMARY KEY (fk_Pagamento_Codigo_pagamento, fk_Veiculos_Placa),
    FOREIGN KEY (fk_Pagamento_Codigo_pagamento) REFERENCES Pagamento(Codigo_pagamento),
    FOREIGN KEY (fk_Veiculos_Placa) REFERENCES Veiculos(Placa)
);

INSERT INTO Cliente (CPF, Nome, Email, Telefone, Endereco, Idade) VALUES
('12345678901', 'Ana Souza', 'ana@email.com', '11999999999', 'Rua A, 100', 28),
('23456789012', 'Carlos Lima', 'carlos@email.com', '11988888888', 'Rua B, 200', 35),
('34567890123', 'Fernanda Alves', 'fernanda@email.com', '11977777777', 'Rua C, 300', 40),
('45678901234', 'João Pereira', 'joao@email.com', '11966666666', 'Rua D, 400', 31),
('56789012345', 'Mariana Silva', 'mariana@email.com', '11955555555', 'Rua E, 500', 27),
('67890123456', 'Ricardo Gomes', 'ricardo@email.com', '11944444444', 'Rua F, 600', 45),
('78901234567', 'Beatriz Costa', 'bia@email.com', '11933333333', 'Rua G, 700', 30),
('89012345678', 'Lucas Rocha', 'lucas@email.com', '11922222222', 'Rua H, 800', 29);

INSERT INTO Aluguel (Codigo_aluguel, Data_inicio, Data_fim, Quilometragem_inicial, Quilometragem_final, Status_aluguel, Valor_total, fk_Cliente_CPF) VALUES
(23, '2025-09-01', '2025-09-05', 15000, 15300, 'Finalizado', 720.00, '12345678901'),
(15, '2025-09-02', '2025-09-06', 20000, 20250, 'Ativo', 680.00, '23456789012'),
(78, '2025-09-03', '2025-09-07', 10000, 10150, 'Finalizado', 480.00, '34567890123'),
(36, '2025-09-04', '2025-09-08', 25000, 25220, 'Ativo', 550.00, '45678901234'),
(12, '2025-09-05', '2025-09-10', 18000, 18350, 'Reservado', 1000.00, '56789012345'),
(95, '2025-09-06', '2025-09-11', 5000, 5150, 'Ativo', 360.00, '67890123456'),
(37, '2025-09-07', '2025-09-12', 22000, 22250, 'Cancelado', 500.00, '78901234567'),
(24, '2025-09-08', '2025-09-13', 12000, 12250, 'Ativo', 880.00, '89012345678');


INSERT INTO Veiculos (Placa, Modelo, Marca, Ano, Valor_da_diaria, Status_veiculos) VALUES
('ABC1A23', 'Civic', 'Honda', 2022, 180.00, 'Disponível'),
('DEF4B56', 'Corolla', 'Toyota', 2021, 170.00, 'Disponível'),
('GHI7C89', 'Onix', 'Chevrolet', 2023, 120.00, 'Disponível'),
('JKL0D12', 'HB20', 'Hyundai', 2020, 110.00, 'Disponível'),
('MNO3E45', 'Compass', 'Jeep', 2022, 200.00, 'Disponível'),
('PQR6F78', 'Gol', 'Volkswagen', 2019, 90.00, 'Disponível'),
('STU9G01', 'Sandero', 'Renault', 2021, 100.00, 'Disponível'),
('VWX2H34', 'Argo', 'Fiat', 2022, 105.00, 'Disponível');


INSERT INTO Pagamento (Codigo_pagamento, Data_pagamento, Valor_total, Forma_de_pagamento, Tipo_de_aluguel, Seguro_incluso) VALUES
('20', '2025-09-01', 720.00, 'Cartão', 'Diário', 'Sim'),
('14', '2025-09-02', 680.00, 'Pix', 'Diário', 'Não'),
('27', '2025-09-03', 480.00, 'Dinheiro', 'Diário', 'Não'),
('85', '2025-09-04', 550.00, 'Cartão', 'Semanal', 'Sim'),
('23', '2025-09-05', 1000.00, 'Boleto', 'Semanal', 'Sim'),
('145', '2025-09-06', 360.00, 'Pix', 'Diário', 'Não'),
('32', '2025-09-07', 500.00, 'Cartão', 'Diário', 'Sim'),
('56', '2025-09-08', 880.00, 'Cartão', 'Semanal', 'Sim');


INSERT INTO Manutencao (Codigo_manutencao, Data_manutencao, Descricao, Tipo_manutencao, Custo, Responsavel) VALUES
('86', '2025-08-01', 'Troca de óleo', 'Preventiva', 150.00, 'Oficina A'),
('57', '2025-08-05', 'Revisão de freios', 'Corretiva', 280.00, 'Oficina B'),
('24', '2025-08-10', 'Troca de pneus', 'Preventiva', 1150.00, 'Oficina A'),
('63', '2025-08-15', 'Bateria nova', 'Corretiva', 390.00, 'Oficina C'),
('80', '2025-08-20', 'Revisão geral', 'Preventiva', 780.00, 'Oficina B'),
('65', '2025-08-25', 'Alinhamento', 'Preventiva', 190.00, 'Oficina A'),
('10', '2025-08-28', 'Troca de filtro', 'Preventiva', 95.00, 'Oficina D'),
('60', '2025-08-30', 'Reparo no ar-condicionado', 'Corretiva', 580.00, 'Oficina C');


UPDATE Aluguel
SET Status_aluguel = 'Finalizado'
WHERE Codigo_aluguel = 23;

UPDATE Aluguel
SET Valor_total = 550.00
WHERE Codigo_aluguel = 36;

SELECT COUNT(*) AS Total_Alugueis,
MIN(Valor_total) AS Valor_Minimo,
MAX(Valor_total) AS Valor_Maximo
FROM Aluguel;

SELECT AVG(Idade) AS Media_Idade
FROM Cliente;

SELECT
    V.Placa,
    V.Marca,
    V.Modelo,
    M.Tipo_manutencao,
    M.Data_manutencao
FROM Veiculos AS V
LEFT JOIN Contem AS C
ON V.Placa = C.fk_Veiculos_Placa
LEFT JOIN Manutencao AS M
ON C.fk_Manutencao_Codigo_manutencao = M.Codigo_manutencao;

INSERT INTO Compra (fk_Pagamento_Codigo_pagamento, fk_Veiculos_Placa) VALUES
(20, 'ABC1A23'),
(27, 'GHI7C89'),
(56, 'VWX2H34');

SELECT 
    v.Placa,
    v.Modelo,
    v.Marca,
    p.Codigo_pagamento,
    p.Data_pagamento,
    p.Forma_de_pagamento,
    p.Valor_total
FROM Veiculos v
INNER JOIN Compra co 
    ON v.Placa = co.fk_Veiculos_Placa
INNER JOIN Pagamento p 
    ON co.fk_Pagamento_Codigo_pagamento = p.Codigo_pagamento;


SELECT * FROM Cliente;
SELECT * FROM Aluguel;
SELECT * FROM Pagamento;
SELECT * FROM Veiculos;
SELECT * FROM Manutencao;