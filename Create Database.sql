CREATE TABLE Estado (
    ID_Estado INT PRIMARY KEY,
    Nome_Estado VARCHAR(100)
);

CREATE TABLE Cultura (
    ID_Cultura INT PRIMARY KEY,
    Nome_Cultura VARCHAR(100)
);

CREATE TABLE Safra (
    ID_Safra INT PRIMARY KEY,
    Ano_Safra INT
);

CREATE TABLE Producao (
    ID_Producao INT PRIMARY KEY,
    Produção DECIMAL(15,2),
    Área_Plantada DECIMAL(15,2),
    Área_Colhida DECIMAL(15,2),
    Produtividade DECIMAL(15,2),
    ID_Estado INT,
    ID_Cultura INT,
    ID_Safra INT,
    FOREIGN KEY (ID_Estado) REFERENCES Estado(ID_Estado),
    FOREIGN KEY (ID_Cultura) REFERENCES Cultura(ID_Cultura),
    FOREIGN KEY (ID_Safra) REFERENCES Safra(ID_Safra)
);
