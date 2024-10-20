
# Modelo de Banco de Dados Normalizado para Produção Agrícola

## Modelo Entidade-Relacionamento (MER)

As entidades principais são **Estados**, **Culturas**, **Produção**, e **Safras**, conectadas pelos seguintes relacionamentos:

- Um **Estado** possui várias **Produções**.
- Uma **Cultura** possui várias **Produções**.
- Uma **Safra** possui várias **Produções**.

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

## Modelo Relacional

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

## Dicionário de Dados

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
