class PlacesController < ApplicationController
  def show
    @place = Place.find_or_create_by_external_id params[:external_id]
    if !@place
      @place = new Place;
    end
    @place.populate_secondary_data

    render :json => @place.to_json(:methods => [:food_cost, :food_value, :drink_cost, :drink_value])
  end
end
