# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      commonphasefirst_users_path
    else
      users_path
    end
  end

end
