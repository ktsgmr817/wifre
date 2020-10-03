class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  #before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :lastname, :firstname, :university, :birth_date, :sex, :grade,
      :faculty, :department
      ])
    # アカウント編集の時にストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :nickname
      #, :lastname, :firstname, :university, :birth_date, :sex, :grade,
      #:faculty, :department
      ])
  end

end
