# imports 
import os
import requests
from pprint import pprint


# Définir l'URL de l'API
# URL : contient l'adresse de l'API JsonPlaceholder à laquelle la requête 
# POST sera envoyée.
url = 'https://my-json-server.typicode.com/DaiTensa/briefs_simplon_MS_IA_25-03-2024-29-05-2024/posts'


# Définition du playload : un dictionnaire python contenant les données
# dans notre cas c'est le contenu du fichier db.json
# payload = {
#     "title": "foo",
#     "body": "bar",
#     "userId": 1
# }


response = requests.get(url)
# Vérification du statut HTTP, 
# 201 : la ressource a été créée avec succès
# On imprime les données sous format json response.json()

if response.status_code == 200:
    print('Données envoyées avec succès:', response.json())
    pprint(response.json())
else:
    print('Erreur:', response.status_code)