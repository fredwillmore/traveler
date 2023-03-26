class PlacesController < ApplicationController
  def show
    @place = Place.find_or_create_by_external_id params[:external_id]
  end
end
