class SearchController < ApplicationController

  def index
    zip = params["q"]
    @conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=10") do |faraday|
    faraday.headers["X-API-KEY"] = ENV["nrel_key"]
    faraday.adapter Faraday.default_adapter
  end
  end
end