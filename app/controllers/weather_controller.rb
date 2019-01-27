# Weather Controller
class WeatherController < ApplicationController
  # API URLS
  OPEN_WEATHER_URL = 'http://api.openweathermap.org/data/2.5/weather?q=kathmandu,np&APPID=32853277f3fa28addad2b2f8e42903f6'.freeze
  DARK_SKY_URL = 'https://api.darksky.net/forecast/6a6b8657a17db4fc8fc7f18731d39b12/27.7172,85.3240'.freeze

  def index
    open_weather_temperature = fetch_api(OPEN_WEATHER_URL)['main']['temp']
    dark_sky_temperature = fetch_api(DARK_SKY_URL)['currently']['temperature']
    # open_weather
    @first_celcius = (open_weather_temperature - 273.15).round(2)
    # dark_sky_weather
    @second_celcius = ((dark_sky_temperature - 32) * 0.56).round(2)
    # average
    @average_temp = ((@tempInCelcius + @temp2) / 2).round(2)
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
