class V1::BaseController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :authenticate_api_user!
end
