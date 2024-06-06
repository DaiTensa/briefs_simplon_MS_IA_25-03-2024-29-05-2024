import requests
from pprint import pprint
import pandas as pd

def save_transformed_df(df, path, filename, columns_to_save):
    
    # Fonction pour Save un df, dans le dossier : path avec le nom : filename, 
    # avec sélection des colonnes : columns_to_save
    
    df[columns_to_save].to_csv(path + filename, index=False)
    
# Initialisation : 
keys_to_extract = ["foodId", "label", "category", "image", "foodContentsLabel"]
API_ID = "8b85ae85"
API_KEY = "aeb421086ceb01cecb4d25f83ad263fb"
SESSIONS = [40, 80, 120, 160, 200]
PAGE_SIZE = 20
KEY_WORD = "Champagne"

url = f"https://api.edamam.com/api/food-database/v2/parser?app_id={API_ID}&app_key={API_KEY}"

products_= []

# for i in range(len(SESSIONS)):
    
for session in SESSIONS:
    querystring = {"ingr" : KEY_WORD, "pageSize" : PAGE_SIZE , "session" : session , "nutrition-type": "logging"}

    headers = {"X-RapidAPI-Key": "bdbc716e1emsh9ab436fbb5bf50bp1e575ejsn5844c86845ad",
               "X-RapidAPI-Host": "edamam-food-and-grocery-database.p.rapidapi.com"
              }
    response = requests.request("GET", url, headers=headers, params=querystring)

    products = response.json()

    for i in range(len(products['hints'])):
        test = (products['hints'][i]['food']).keys()

        if all(key in test for key in keys_to_extract):

            product_information = {
                "foodId" : products['hints'][i]['food']['foodId'],
                "label" : products['hints'][i]['food']['label'],
                "category" : products['hints'][i]['food']['category'],
                "foodContentsLabel" : products['hints'][i]['food']['foodContentsLabel'],
                "image" : products['hints'][i]['food']['image']
            }

            products_.append(product_information)

pprint(products_) 

df_results_ = pd.DataFrame(products_)
# transformed_customers_dataset
df = df_results_
path = "data/"
filename = "extracted_products_champagne_dataset.csv"
columns_to_save = keys_to_extract

# Save
save_transformed_df(df, path, filename, columns_to_save)