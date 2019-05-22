class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, alert: exception.message
  end
  
  def after_sign_in_path_for(resource)
    products_path
  end
end
