class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_users_list
    current_users.map {|u| u.first_name}
  end

  helper_method :current_users_list

  def current_user_id_list
    current_users.map {|u| u.id}
  end

  helper_method :current_user_id_list

end
