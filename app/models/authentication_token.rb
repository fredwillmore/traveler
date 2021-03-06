class AuthenticationToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true
  scope :valid,  -> { where( expires_at: nil).or( 'expires_at > ?', Time.zone.now) }
end
