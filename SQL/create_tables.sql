-- Tabela Customer
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- ID único do cliente
    email VARCHAR(255) NOT NULL UNIQUE,          -- Email do cliente
    first_name VARCHAR(100) NOT NULL,            -- Nome do cliente
    last_name VARCHAR(100) NOT NULL,             -- Sobrenome do cliente
    gender ENUM('M', 'F', 'Other') NOT NULL,     -- Gênero
    address TEXT,                                -- Endereço
    birth_date DATE,                             -- Data de nascimento
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data de criação do registro
);

-- Tabela Category
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,  -- ID único da categoria
    description VARCHAR(255) NOT NULL,          -- Descrição da categoria
    path VARCHAR(500)                           -- Caminho (path) hierárquico da categoria
);

-- Tabela Item
CREATE TABLE Item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,     -- ID único do item
    name VARCHAR(255) NOT NULL,                 -- Nome do produto
    price DECIMAL(10, 2) NOT NULL,              -- Preço do produto
    state ENUM('Active', 'Inactive') NOT NULL,  -- Estado do produto
    end_date DATE,                              -- Data de desativação
    category_id INT,                            -- Chave estrangeira para Category
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Tabela Order
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,    -- ID único do pedido
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e hora do pedido
    customer_id INT NOT NULL,                   -- Chave estrangeira para Customer
    item_id INT NOT NULL,                       -- Chave estrangeira para Item
    quantity INT NOT NULL CHECK (quantity > 0), -- Quantidade de itens comprados
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);