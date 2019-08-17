class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_many :players
  has_many :authentication_tokens

  devise :invitable, :database_authenticatable, :timeoutable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email, :case_sensitive => false

  def current_player
    players.find_by is_current_player: true
  end

  def current_player= player
    players.find(player).update_attribute :is_current_player, true
  end

end
