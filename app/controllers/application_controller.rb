class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


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
      :nickname, :image, :birth_place,
      :commonclass1, :commonclass2, :commonclass3, :commonclass4, :commonclass5,
      { hobby_ids: [] }
      ])
  end

end
