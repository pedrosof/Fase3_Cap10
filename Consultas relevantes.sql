## Consultas SQL Relevantes

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
