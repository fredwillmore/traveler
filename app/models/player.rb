class Player < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_many :player_quantities
  has_many :quantities, :through => :player_quantities
  belongs_to :location
  belongs_to :destination, class_name: Location

  has_attached_file :avatar, styles: { xsmall: "20", small: "50", medium: "150", large: "400", xlarge: "500", xxlarge: "600" }, default_url: "/images/:style/missing.png"
  validates_with AttachmentContentTypeValidator, attributes: :avatar, content_type: ['image/jpeg', 'image/jpg', 'image/png']
  def avatar_urls
    {
      xsmall:   avatar.url(:xsmall),
      small:    avatar.url(:small),
      medium:   avatar.url(:medium),
      large:    avatar.url(:large),
      xlarge:   avatar.url(:xlarge),
      xxlarge:  avatar.url(:xxlarge)
    }
  end

  state_machine :state, :initial => :normal do
    state :normal
    state :travel

    event :start_travel do
      transition :normal => :travel
    end

    event :finish_travel do
      transition :travel => :normal
    end
  end
end
