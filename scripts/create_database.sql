CREATE DATABASE bd_vendas;

USE bd_vendas;

CREATE TABLE tb_cliente (
    pk_cliente INT PRIMARY KEY IDENTITY(0,1),
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL
)


CREATE TABLE tb_vendedor (
    pk_vendedor INT PRIMARY KEY IDENTITY(0,1),
    nome VARCHAR(255) NOT NULL
)


CREATE TABLE tb_produto (
    pk_produto INT PRIMARY KEY IDENTITY(0,1),
    nome VARCHAR(255) NOT NULL,
    quantidade_estoque INT NOT NULL
)

CREATE TABLE tb_loja (
    pk_loja INT PRIMARY KEY IDENTITY(0,1),
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) NOT NULL
)

CREATE TABLE tb_venda (
    pk_venda INT PRIMARY KEY IDENTITY(0,1),
    percentual_desconto FLOAT,
    data_venda DATETIME NOT NULL,
    fk_loja INT REFERENCES tb_loja(pk_loja),
    fk_vendedor INT REFERENCES tb_vendedor(pk_vendedor),
    fk_cliente INT REFERENCES tb_cliente(pk_cliente),
    valor_total FLOAT
)

CREATE TABLE tb_NotaFiscal (
    pk_notafiscal INT PRIMARY KEY IDENTITY(0,1),
    fk_loja INT NOT NULL,
    fk_venda INT
)

CREATE TABLE tb_itens (
    pk_item INT PRIMARY KEY IDENTITY(0,1),
    fk_venda INT,
    fk_produto INT
)