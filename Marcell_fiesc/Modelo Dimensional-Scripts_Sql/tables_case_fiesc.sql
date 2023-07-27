fVENDAS



CREATE OR REPLACE VIEW FVENDAS AS
SELECT 
    V.id AS id_venda,
    V.data AS data_venda,
    V.desconto AS desconto_venda,
    V.status AS status_venda,
    C.id AS id_cliente,
    C.nome AS nome_cliente,
    C.email AS email_cliente,
    C.sexo AS sexo_cliente,
    C.data_nascimento AS data_nascimento_cliente,
    P.id AS id_produto,
    P.nome AS nome_produto,
    P.preco AS preco_produto,
    Cat.id AS id_categoria,
    Cat.nome AS nome_categoria,
    IV.quantidade AS quantidade_itens,
    IV.preco AS preco_itens
FROM 
    venda AS V
LEFT JOIN
    cliente AS C ON V.id_cliente = C.id
LEFT JOIN
    itens_venda AS IV ON V.id = IV.id_venda
LEFT JOIN
    produto AS P ON IV.id_produto = P.id
LEFT JOIN
    categoria AS Cat ON P.id_categoria = Cat.id;




--DCATEGORIA

CREATE OR REPLACE VIEW DCATEGORIA AS
SELECT 
    id AS id_categoria,
    nome AS nome_categoria
FROM 
    categoria;



 ---DPRODUTO


 CREATE OR REPLACE VIEW DPRODUTO AS
SELECT 
    P.id AS id_produto,
    P.nome AS nome_produto,
    P.preco AS preco_produto,
    P.id_categoria AS id_categoria_produto,
    C.nome AS nome_categoria
FROM 
    produto AS P
JOIN
    categoria AS C ON P.id_categoria = C.id;



--DCLIENTE


CREATE OR REPLACE VIEW DCLIENTE AS
SELECT 
    id AS id_cliente,
    nome AS nome_cliente,
    email AS email_cliente,
    sexo AS sexo_cliente,
    data_nascimento AS data_nascimento_cliente
FROM 
    cliente;

 --DITENS_VENDIDOS


 CREATE OR REPLACE VIEW DITENS_VENDIDOS AS
SELECT 
    IV.id AS id_item,
    IV.id_venda AS id_venda_item,
    IV.id_produto AS id_produto_item,
    IV.quantidade AS quantidade_item,
    IV.preco AS preco_item,
    P.nome AS nome_produto,
    P.preco AS preco_produto,
    C.nome AS nome_categoria
FROM 
    itens_venda AS IV
JOIN
    produto AS P ON IV.id_produto = P.id
JOIN
    categoria AS C ON P.id_categoria = C.id;
