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


if response.status_code == 200:
    data = response.json()
    pprint(data)
else:
    print('Erreur:', response.status_code)

# if response.status_code == 200:
#     data = response.json()
#     main = data['main']
#     wind = data['wind']
#     weather = data['weather'][0]

#     print(f"Ville: {city}")
#     print(f"Température: {main['temp']}°K")
#     print(f"Température: {round(main['temp'] - 273.15)}°C")
#     print(f"Pression: {main['pressure']} hPa")
#     print(f"Humidité: {main['humidity']}%")
#     print(f"Vitesse du vent: {wind['speed']} m/s")
#     print(f"Description: {weather['description']}")
# else:
#     print('Erreur:', response.status_code)
