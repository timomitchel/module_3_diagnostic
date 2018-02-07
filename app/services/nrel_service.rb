class NrelService

  def initialize(zip)
    @zip = zip
  end
  
  def stations
    @search = JSON.parse(faraday_call.body, symbolize_names: true)[:fuel_stations]
  end
  
  private
  
  attr_reader :zip

  def faraday_call
     Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_key"]}&location=#{zip}&fuel_type=ELEC,LPG&radius=6.0&status=E&limit=10")
  end

end