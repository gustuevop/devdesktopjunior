# Controle de CEP

Collection do postman:<br> 
https://elements.getpostman.com/redirect?entityId=35196649-5cc1506b-c85c-4af3-bbd6-7520646a19f5&entityType=collection

## Scritps do banco de dados:

```
CREATE DATABASE "TspdCep"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;`
```
```
CREATE TABLE TspdCep (
	cep VARCHAR(8) PRIMARY KEY NOT NULL,
	logradouro VARCHAR(120),
	complemento VARCHAR(120),
	bairro VARCHAR(120),
	localidade VARCHAR(120),
	uf VARCHAR(2),
	ibge VARCHAR(7),
	ddd VARCHAR(2)
);
```

```
SELECT cep FROM TspdCep WHERE uf = 'PR';
```
