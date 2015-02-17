class SearchSuggestionsController < ApplicationController
  def index
    render json: SearchSuggestion.terms_for(request.params["term"])
  end
end
