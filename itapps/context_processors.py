import requests
from functools import lru_cache
from datetime import datetime, timedelta

@lru_cache(maxsize=32)
def get_weather(city, country, api_key):
    url = f'https://api.openweathermap.org/data/2.5/weather?q={city},{country}&units=metric&appid={api_key}'
    return requests.get(url).json()

def weather_data(request):
    cities = [('Sheffield', 'UK'), ('Melaka', 'Malaysia'), ('Bandung', 'Indonesia')]
    api_key = '90578464c7a68309e06ee53085ace0d6'

    weather_data = []
    for city, country in cities:
        city_weather = get_weather(city, country, api_key)
        weather = {
            'city': f"{city_weather['name']}, {city_weather['sys']['country']}",
            'temperature': city_weather['main']['temp'],
            'description': city_weather['weather'][0]['description'],
            'icon': city_weather['weather'][0]['icon']
        }
        weather_data.append(weather)

    return {'weather_data': weather_data}