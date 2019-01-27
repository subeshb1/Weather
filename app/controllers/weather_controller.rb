# Weather Controller
class WeatherController < ApplicationController

  # API URLS
  OPEN_WEATHER_URL = 'http://api.openweathermap.org/data/2.5/weather?q=kathmandu,np&APPID=32853277f3fa28addad2b2f8e42903f6'
  DARK_SKY_URL = 'https://api.darksky.net/forecast/6a6b8657a17db4fc8fc7f18731d39b12/27.7172,85.3240'

  def index
    open_weather_data = fetch_api(OPEN_WEATHER_URL)
    dark_sky_data = fetch_api(DARK_SKY_URL)

  end

  def fetch_api(url)
    response = HTTParty.get(
      url,
      headers: {
        'Accept' => 'application/json'
      }
    )
    response.to_h 
  end
end
