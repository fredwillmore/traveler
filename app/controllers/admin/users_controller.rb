class Admin::UsersController < ApplicationController

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :remember_me
    )
    # TODO: only allow admin to edit role_ids
    # attr_accessible :role_ids, :as => :admin
  end
end
