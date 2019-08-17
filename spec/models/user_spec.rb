require 'rails_helper'

describe User do
  it { should have_many :players }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
<<<<<<< HEAD
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
=======
  it { should validate_uniqueness_of(:email).case_insensitive }
>>>>>>> f74b7da82021b61bc90f1fe47a187cc1354d15c4
end
