# Segunda Parte - APIs (Desejável)

Objetivo
Realizar una análise sobre a oferta / vitrine das opções de productos que respondam a
distintas buscar no site do Mercadolibre.com.ar
Perguntas:

## 1)

Varrer uma lista de mais de 150 itens ids no serviço público:
https://api.mercadolibre.com/sites/MLA/search?q=chromecast&limit=50#json
Nesse caso particular e somente como exemplo, são resultado para a busca
“chromecast”, porém deverá eleger outros términos para o experimento que
permitam enriquecer uma análise em um hipotético dashboard (ex: Google Home,
Apple TV, Amazon Fire TV, e outros para poder comparar dispositivos portáteis, ou
até mesmo eleger outros e que você tenha interesse em comparar).

## 2)

Para cada resultado, realizar o correspondente GET por Item_id no recurso publico:
https://api.mercadolibre.com/items/{Item_Id}

## 3)

Escrever os resultados em um arquivo plano delimitado por vírgulas,
desnormalizando o JSON obtido no passo anterior, em quantos campos sejam
necessários para guardar as variáveis que te interesse modelar.
