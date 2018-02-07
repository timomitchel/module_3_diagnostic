class SearchController < ApplicationController

  def index
    zip = params["q"]
    @conn = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?limit=1&location=80203&api_key=#{ENV["nrel_key"]}") 
    binding.pry
    @search = JSON.parse(@conn.body, symbolize_names: true)[:results]
  end
end