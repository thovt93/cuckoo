class Admin::BaseController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :authorize_admin

  def authorize_admin
    authenticate_api_user!
    raise 'You are not authorized to perform this action.' unless current_api_user.admin?
  end
end
