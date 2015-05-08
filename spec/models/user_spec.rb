require 'rails_helper'

describe User do
  should { have_many :players }
  should { validate_presence_of :first_name, :last_name, :email }
  should { validate_uniqueness_of :email, case_sensitive: false }
end
