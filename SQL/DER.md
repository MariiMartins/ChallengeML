# Explicação do DER

## 1.Tabela Customer

- Representa os usuários (compradores e vendedores) com atributos como nome, e-mail e data de nascimento.
- Permite verificar aniversariantes e filtrar usuários por atividade de compra/venda.

## 2.Tabela Category

- Define categorias para organizar itens/produtos.
- Permite identificar produtos relacionados a “Celulares”.

## 3.Tabela Item

- Representa os produtos com preço, estado (ativo/inativo) e sua associação à categoria.
- Permite rastrear o estado de um item e filtrar por sua categoria.

## 4.Tabela Order

- Reflete transações realizadas no marketplace.
- Armazena informações como cliente, item, quantidade e data da transação.

## 5.Tabela Item_History

- Histórico diário dos preços e estados dos itens.
- Facilita o reprocessamento de dados e análises temporais.

# Relações

- Customer (1) ↔️ (N) Order: Um cliente pode realizar várias compras.
- Order (N) ↔️ (1) Item: Cada pedido está relacionado a um item específico.
- Item (N) ↔️ (1) Category: Cada item pertence a uma única categoria.
- Item (1) ↔️ (N) Item_History: Cada item pode ter múltiplos registros de estado/preço ao longo do tempo