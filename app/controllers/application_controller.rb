class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    if resource.role == 'hr'
      human_resources_path
    elsif resource.role == 'manager'
      human_resources_path
    else
      employees_path
    end
  end
end
