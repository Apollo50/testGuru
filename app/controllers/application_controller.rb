class ApplicationController < ActionController::Base

  def after_sign_in_path_for(user)
    user.is_a?(Admin) ? admin_tests_path : root_path
  end
end
