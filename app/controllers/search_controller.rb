class SearchController < ApplicationController

  def index
    @search = NrelService.new(params["q"]).stations
  end
end