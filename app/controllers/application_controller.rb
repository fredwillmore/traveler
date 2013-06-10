class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale


  private
    def set_locale
#      I18n.locale = current_user.locale
#      I18n.locale = current_user.locale
    end

end
