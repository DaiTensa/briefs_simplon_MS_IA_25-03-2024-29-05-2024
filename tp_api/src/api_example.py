# imports 
import os
import requests
from pprint import pprint
from dotenv import load_dotenv
load_dotenv()

api_key = os.getenv("KEY_API")



# Remplacer 'votre_cle_api' par votre clé API obtenue depuis OpenWeatherMap
city = 'Paris'
url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}'

response = requests.get(url)


# if response.status_code == 200:
#     data = response.json()
# else:
#     print('Erreur:', response.status_code)

# if response.status_code == 200:
#     data = response.json()
#     main = data['main']
#     wind = data['wind']
#     weather = data['weather'][0]

#     print(f"Ville: {city}")
#     print(f"Température: {round(main['temp'] - 273.15)}°C")
#     print(f"Pression: {main['pressure']} hPa")
#     print(f"Humidité: {main['humidity']}%")
#     print(f"Vitesse du vent: {wind['speed']} m/s")
#     print(f"Description: {weather['description']}")
# else:
#     print('Erreur:', response.status_code)

# # Partie 4 : Manipulation des données et gestion des erreurs
# try:
#     response = requests.get(url)
#     response.raise_for_status()
#     data = response.json()
# except requests.exceptions.HTTPError as err:
#     print(f'Erreur HTTP: {err}')
# except requests.exceptions.RequestException as err:
#     print(f'Erreur de requête: {err}')

# if response.status_code == 200:
#     data = response.json()
#     main = data.get('main', {})
#     temperature = main.get('temp')
#     humidity = main.get('humidity')

#     print(f"Température: {temperature}°K")
#     print(f"Humidité: {humidity}%")
# else:
#     print('Erreur:', response.status_code)


if response.status_code == 200:
    data = response.json()
    main = data.get('main', {})
    temperature = main.get('temp')
    humidity = main.get('humidity')

    print(f"Température: {temperature}°K")
    print(f"Humidité: {humidity}%")
else:
    print('Erreur:', response.status_code)


# Écrivez une fonction qui prend en paramètre une ville et 
# retourne les informations météorologiques de cette ville.

# def info_meteorologique_ville(city:str, api_key:str):

#     url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}'
#     try:
#      response = requests.get(url)
#      data = response.json()
#      main = data['main']
#      wind = data['wind']
#      weather = data['weather'][0]
#      print(f"Ville: {city}")
#      print(f"Température: {round(main['temp'] - 273.15)}°C")
#      print(f"Pression: {main['pressure']} hPa")
#      print(f"Humidité: {main['humidity']}%")
#      print(f"Vitesse du vent: {wind['speed']} m/s")
#      print(f"Description: {weather['description']}")

#     except requests.exceptions.HTTPError as err:
#     # Capture et affiche les erreurs HTTP
#         print(f'Erreur HTTP: {err}')
    
#     except requests.exceptions.JSONDecodeError as err:
#         # Capture et affiche les erreurs de décodage JSON (JSON mal formé)
#         print(f'Erreur de décodage JSON: {err}')

#     except requests.exceptions.RequestException as err:
#         # Capture et affiche toutes les autres erreurs liées aux requêtes (comme des problèmes de connexion, timeout, etc.)
#         print(f'Erreur de requête: {err}')
    
#     except Exception as err:
#         # Capture et affiche toutes les autres exceptions non prévues
#         print(f'Une erreur est survenue: {err}')


# info_meteorologique_ville(city= "paris", api_key= api_key)