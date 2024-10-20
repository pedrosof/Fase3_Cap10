
# Modelo de Banco de Dados Normalizado para Produção Agrícola

## Etapa 1: Seleção de Conjunto de Dados

Você pode usar dados da **Produção Agrícola Municipal** (PAM) do IBGE, que inclui séries históricas de produção por estados e culturas. Acesse o site do IBGE (https://www.ibge.gov.br/) para encontrar o conjunto de dados adequado ou use um portal de dados abertos como o **Dados.gov.br**.

## Etapa 2: Análise de Dados

As principais entidades identificadas podem ser:

- **Estados**: Representando os estados brasileiros.
  - Atributos: `ID_Estado`, `Nome_Estado`
  
- **Culturas**: Representando diferentes culturas agrícolas.
  - Atributos: `ID_Cultura`, `Nome_Cultura`

- **Produção**: Representando o registro da produção em toneladas, área plantada e colhida, por estado e safra.
  - Atributos: `ID_Produção`, `Ano`, `Produção`, `Área_Plantada`, `Área_Colhida`, `Produtividade`
  - Relacionamentos: Estado, Cultura, Safra

- **Safras**: Representando os anos de safra.
  - Atributos: `ID_Safra`, `Ano_Safra`

## Etapa 3: Modelo Entidade-Relacionamento (MER)

As entidades principais são **Estados**, **Culturas**, **Produção**, e **Safras**, conectadas pelos seguintes relacionamentos:

- Um **Estado** possui várias **Produções**.
- Uma **Cultura** possui várias **Produções**.
- Uma **Safra** possui várias **Produções**.

## Etapa 4: Normalização

Aplicando a 1FN, 2FN e 3FN:

- **1FN (Primeira Forma Normal)**: Certifique-se de que todos os atributos contêm valores atômicos.
- **2FN (Segunda Forma Normal)**: Elimine dependências parciais.
- **3FN (Terceira Forma Normal)**: Remova dependências transitivas.

## Etapa 5: Modelo Relacional

### Tabela: Estado
- `ID_Estado` (PK)
- `Nome_Estado`

### Tabela: Cultura
- `ID_Cultura` (PK)
- `Nome_Cultura`

### Tabela: Safra
- `ID_Safra` (PK)
- `Ano_Safra`

### Tabela: Produção
- `ID_Produção` (PK)
- `Produção` (Toneladas)
- `Área_Plantada` (Hectares)
- `Área_Colhida` (Hectares)
- `Produtividade` (Toneladas por Hectare)
- `ID_Estado` (FK)
- `ID_Cultura` (FK)
- `ID_Safra` (FK)

## Etapa 6: Código SQL para Criação das Tabelas

```sql
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
```

## Etapa 7: Consultas SQL Relevantes

### 1. Produção total de uma determinada cultura por estado em uma safra

```sql
SELECT E.Nome_Estado, SUM(P.Produção) AS Produção_Total
FROM Producao P
JOIN Estado E ON P.ID_Estado = E.ID_Estado
JOIN Cultura C ON P.ID_Cultura = C.ID_Cultura
JOIN Safra S ON P.ID_Safra = S.ID_Safra
WHERE C.Nome_Cultura = 'Milho' AND S.Ano_Safra = 2023
GROUP BY E.Nome_Estado;
```

### 2. Evolução da área plantada de uma cultura ao longo dos anos

```sql
SELECT S.Ano_Safra, SUM(P.Área_Plantada) AS Área_Total_Plantada
FROM Producao P
JOIN Cultura C ON P.ID_Cultura = C.ID_Cultura
JOIN Safra S ON P.ID_Safra = S.ID_Safra
WHERE C.Nome_Cultura = 'Soja'
GROUP BY S.Ano_Safra
ORDER BY S.Ano_Safra;
```

### 3. Ranking dos estados com maior produtividade em uma cultura específica

```sql
SELECT E.Nome_Estado, AVG(P.Produtividade) AS Produtividade_Média
FROM Producao P
JOIN Estado E ON P.ID_Estado = E.ID_Estado
JOIN Cultura C ON P.ID_Cultura = C.ID_Cultura
WHERE C.Nome_Cultura = 'Trigo'
GROUP BY E.Nome_Estado
ORDER BY Produtividade_Média DESC;
```

## Etapa 8: Dicionário de Dados

### Tabela: Estado
- **ID_Estado**: Identificador único do estado (PK).
- **Nome_Estado**: Nome do estado.

### Tabela: Cultura
- **ID_Cultura**: Identificador único da cultura (PK).
- **Nome_Cultura**: Nome da cultura agrícola.

### Tabela: Safra
- **ID_Safra**: Identificador único da safra (PK).
- **Ano_Safra**: Ano da safra.

### Tabela: Produção
- **ID_Produção**: Identificador único da produção (PK).
- **Produção**: Quantidade de produção (Toneladas).
- **Área_Plantada**: Área plantada (Hectares).
- **Área_Colhida**: Área colhida (Hectares).
- **Produtividade**: Produção por hectare (Toneladas/Hectare).
- **ID_Estado**: Chave estrangeira para a tabela Estado (FK).
- **ID_Cultura**: Chave estrangeira para a tabela Cultura (FK).
- **ID_Safra**: Chave estrangeira para a tabela Safra (FK).
