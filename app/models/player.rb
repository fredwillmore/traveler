class Player < ActiveRecord::Base
  include AASM

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_many :player_quantities
  has_many :quantities, :through => :player_quantities
  belongs_to :location, optional: true
  belongs_to :destination, class_name: 'Location', optional: true
  delegate :current_user, to: :user

  has_one_attached :avatar # , styles: { xsmall: "20", small: "50", medium: "150", large: "400", xlarge: "500", xxlarge: "600" }, default_url: "/images/:style/missing.png"
  # validates_with AttachmentContentTypeValidator, attributes: :avatar, content_type: ['image/jpeg', 'image/jpg', 'image/png']
  
  def avatar_urls
    # this requires imagemagick or graphicsmagick, I'd rather not deal trying to install either of those on this laptop for now
    # path = Rails.application.routes.url_helpers.rails_blob_path(avatar.blob.variant(resize: "100x100"), only_path: true)
    # just give 'em baby yoda
    path = "https://assets-prd.ignimgs.com/2019/11/21/960x0-1574375485306.jpeg?crop=16%3A9&width=replace_me"
    {
      xsmall:   path.gsub('replace_me', '20'),
      small:    path.gsub('replace_me', '50'),
      medium:   path.gsub('replace_me', '150'),
      large:    path.gsub('replace_me', '300'),
      xlarge:   path.gsub('replace_me', '400'),
      xxlarge:  path.gsub('replace_me', '500')
    }
  end
  
  aasm column: :state do
    state :normal, initial: true
    state :travel

    event :start_travel do
      transitions from: :normal, to: :travel
    end

    event :finish_travel do
      transitions from: :travel, to: :normal
    end
  end

  # TODO: using locations instead of places for player location/destination seems more complicated than necessary.
  # can I just use Places?

  def location_external_id
    location&.place&.external_id
  end

  def destination_external_id
    destination&.place&.external_id
  end

  def set_trip(destination_external_id, mode = 'driving')
    destination = Place.find_or_create_by_external_id(destination_external_id).location
    matrix = GoogleDistanceMatrix::Matrix.new
    matrix.origins << location
    matrix.destinations << destination
    matrix.configure do |config|
      config.google_api_key = Place::API_KEY
      config.mode = "walking"
    end
    trip_time = matrix.data[0][0].duration_in_seconds
    update(
      arrival_time: Time.now + trip_time,
      destination: destination
    )
    # debugger
  end

  def set_arrival
    if travel?
      if arrival_time <= Time.now
        finish_travel!
      end
    else
      update(arrival_time: nil)
    end
  end
end
