-- 1. Listar os usuários que fazem aniversário hoje e realizaram mais de 1500 vendas em janeiro de 2020
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_sales
FROM Customer c
JOIN "Order" o ON c.customer_id = o.customer_id
JOIN Item i ON o.item_id = i.item_id
JOIN Category cat ON i.category_id = cat.category_id
WHERE 
    MONTH(c.birth_date) = MONTH(CURRENT_DATE()) -- Aniversário no mês atual
    AND DAY(c.birth_date) = DAY(CURRENT_DATE()) -- Aniversário no dia atual
    AND MONTH(o.order_date) = 1                -- Vendas em Janeiro
    AND YEAR(o.order_date) = 2020              -- Vendas no ano de 2020
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1500;              -- Mais de 1500 vendas


-- 2. Top 5 usuários que mais venderam na categoria “Celulares” por mês em 2020
SELECT 
    MONTH(o.order_date) AS sales_month,
    YEAR(o.order_date) AS sales_year,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_sales,
    SUM(o.quantity) AS total_products_sold,
    SUM(o.quantity * i.price) AS total_revenue
FROM "Order" o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Item i ON o.item_id = i.item_id
JOIN Category cat ON i.category_id = cat.category_id
WHERE 
    cat.description LIKE '%Celulares%'       -- Categoria "Celulares"
    AND YEAR(o.order_date) = 2020           -- Apenas no ano de 2020
GROUP BY 
    sales_month, sales_year, c.customer_id, c.first_name, c.last_name
ORDER BY 
    sales_month,
    total_revenue DESC
LIMIT 5;                                    -- Top 5 por mês


-- 3. Popular tabela com preço e estado dos itens no final do dia
-- a) Estrutura da Tabela de Histórico
CREATE TABLE Item_History (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    state ENUM('Active', 'Inactive') NOT NULL,
    snapshot_date DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

-- b) Store Procedure para Popular a Tabela
DELIMITER $$

CREATE PROCEDURE PopulateItemHistory()
BEGIN
    -- Exclui registros duplicados do dia atual, permitindo reprocesso
    DELETE FROM Item_History
    WHERE snapshot_date = CURRENT_DATE;

    -- Insere os dados atuais dos itens
    INSERT INTO Item_History (item_id, price, state, snapshot_date)
    SELECT item_id, price, state, CURRENT_DATE
    FROM Item;
END$$

DELIMITER ;

-- c) Agendamento do Processo (utilizando o Schedule do MySQL)
CREATE EVENT PopulateItemHistoryEvent
ON SCHEDULE EVERY 1 DAY
STARTS '2024-11-18 00:00:00'
DO
CALL PopulateItemHistory();