# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

# ログイン後のページ遷移
  def after_sign_in_path_for(resource)
    # ログイン回数が1回なら'commonphasefirst'、それ以外なら'users'へ
    if resource.sign_in_count == 1
      commonphasefirst_users_path
    else
      users_path
    end
  end

end
