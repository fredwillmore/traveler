# class Login < Grape::API
class Login
  # format :json
  # desc 'End-points for the Login'
  # namespace :login do
  #   desc 'Login via email and password'
  #   params do
  #     requires :email, type: String, desc: 'email'
  #     requires :password, type: String, desc: 'password'
  #   end
  #   post do
  #     user = User.find_by_email params[:email]
  #     if user.present? && user.valid_password?(params[:password])
  #       { token: user.authentication_tokens.new }
  #     else
  #       error_msg = 'Bad Authentication Parameters'
  #       error!({ error_msg: error_msg }, 401)
  #     end
  #   end
  # end

  # rescue_from Grape::Exceptions::ValidationErrors do |e|
  #   rack_response({
  #     status: e.status,
  #     error_msg: e.message,
  #   }.to_json, 400)
  # end
end