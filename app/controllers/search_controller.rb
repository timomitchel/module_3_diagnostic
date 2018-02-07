class SearchController < ApplicationController

  def index
    zip = params["q"]
    @conn = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_key"]}&location=#{zip}&fuel_type=ELEC,LPG&radius=6.0&status=E&limit=10")
    @search = JSON.parse(@conn.body, symbolize_names: true)[:fuel_stations]
  end
end