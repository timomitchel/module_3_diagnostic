class StationSearch

  def initialize(zip)
    @zip = zip
  end

  def stations
    NrelService.new(zip).stations.map do |station_data|
      Station.new(station_data)
    end
  end
  private
  attr_reader :zip
end