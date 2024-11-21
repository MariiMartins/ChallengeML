import requests
import csv

# Termos de busca para a análise
search_terms = ["chromecast", "Google Home", "Apple TV", "Amazon Fire TV"]

# Lista para armazenar IDs
item_ids = []

# Etapa 1: Buscar itens e coletar IDs
for term in search_terms:
    print(f"Buscando itens para: {term}")
    response = requests.get(
        f"https://api.mercadolibre.com/sites/MLA/search?q={term}&limit=50"
    )
    if response.status_code == 200:
        results = response.json().get("results", [])
        item_ids.extend([item["id"] for item in results])

print(f"Total de itens coletados: {len(item_ids)}")

# Etapa 2: Obter detalhes dos itens
items_data = []
for item_id in item_ids:
    print(f"Coletando dados para o item: {item_id}")
    response = requests.get(f"https://api.mercadolibre.com/items/{item_id}")
    if response.status_code == 200:
        item_details = response.json()
        # Extraindo os campos relevantes
        items_data.append({
            "id": item_details.get("id"),
            "title": item_details.get("title"),
            "price": item_details.get("price"),
            "currency_id": item_details.get("currency_id"),
            "category_id": item_details.get("category_id"),
            "available_quantity": item_details.get("available_quantity"),
            "sold_quantity": item_details.get("sold_quantity"),
            "condition": item_details.get("condition"),
        })

# Etapa 3: Escrever os dados em um arquivo CSV
output_file = "mercadolibre_items.csv"
with open(output_file, mode="w", newline="", encoding="utf-8") as file:
    writer = csv.DictWriter(file, fieldnames=items_data[0].keys())
    writer.writeheader()
    writer.writerows(items_data)

print(f"Dados salvos no arquivo {output_file}")