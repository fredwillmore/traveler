class SearchSuggestion < ActiveRecord::Base
  def self::terms_for prefix
    # PlaceType.where("label like ?", "#{prefix}_%").map(&:label)
    # TODO: for now just searching on place type names, but eventually ...
    suggestions = where("term like ?", "#{prefix}%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end
end
