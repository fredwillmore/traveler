class API < Grape::API
  prefix 'api'
  mount Login
end