# Objetivo

Com base no caso de uso descrito abaixo, será necessário criar um DER que responda ao
modelo de negócio. Na sequência temos algumas perguntas as quais devem ser
respondidas utilizando a linguagem SQL.

Descrição da necessidade (caso de uso): Tendo em conta um modelo de ecommerce que trabalhamos, temos algumas entidades
básicas que queremos representar: Customer, Order, Item y Category.

- Customer: É a entidade onde se encontram todos os nossos usuários, sejam eles
Buyers ou Sellers do site. Os principais atributos são email, nome, sobrenome, sexo,
endereço, data de nascimento e outros mais.
- Item: É a entidade onde se encontram os produtos publicados no nosso
marketplace. O volume é muito grande, pois temos todos os produtos que foram
publicados, independente de estarem ativos ou não. Para identificar o estado de um
produto temos que fazer uma consulta pelo estado do item ou pelo campo de baixa (end_date).
- Category: É a entidade onde temos a descrição de cada categoria com seu respectivo path.
Cada item tem uma categoria associada a ele.
- Order: A tabela order é a entidade que reflete as transações geradas dentro do site (cada compra é uma order).
Nesse caso não vamos levar em conta o fluxo do carrinho de compras, porém para cada item que for vendido será refletido
em uma order independente da quantidade que for comprada.

## Fluxo de Compras

Um usuário entra no site do Mercado Livre para comprar dois celulares idênticos. Realiza
uma busca na categoria Tecnologia > Celulares e Telefones> Celulares e Smartphones e,
por fim, encontra o produto que deseja comprar. Segue com a compra, selecionando duas
unidades iguais e com isso será gerado uma ordem de compra.

Para resolver

1. Listar os usuários que fazem aniversário no dia de hoje e que a quantidade de
vendas realizadas em Janeiro/2020 sejam superiores a 1500;
2. Para cada mês de 2020, solicitamos que seja exibido um top 5 dos usuários que
mais venderam ($) na categoria Celulares. Solicitamos o mês e ano da análise,
nome e sobrenome do vendedor, quantidade de vendas realizadas, quantidade de
produtos vendidos e o total vendido;
3. Solicitamos popular uma nova tabela com o preço e estado dos itens no final do dia.
Considerar que esse processo deve permitir um reprocesso. Vale ressaltar que na
tabela de item, vamos ter unicamente o último estado informado pela PK definida
(esse item pode ser resolvido através de uma store procedure).

## Backlog das Tareas

A partir da situação definida, solicitamos:

- Desenhar un DER do modelo de dados que possa responder cada uma das
perguntas feitas anteriormente;
- Gerar um script DDL para a criação de cada uma das tabelas representadas no
DER. Enviar o arquivo com o nome: “create_tables.sql”.
- Gerar o código SQL para responder cada una das situações mencionadas
anteriormente sobre o modelo desenhado. Nome do arquivo: “respostas_negocio.sql”
