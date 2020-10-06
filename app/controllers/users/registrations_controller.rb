# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3


  def new
    @user = User.new
  end

  def step1
    @user = User.new
  end

  def step2
    session[:university_id] = user_params[:university_id]
    @University = University.find_by(id: session[:university_id])
    session[:domain] = @University.domain
    @user = User.new
  end

  def step3
    session[:email] = user_params[:email_account] + session[:domain]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new
  end

  def create
    @user = User.new(
      university_id: session[:university_id],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      lastname: user_params[:lastname],
      firstname: user_params[:firstname],
      nickname: user_params[:nickname],
      birth_date: user_params[:birth_date],
      sex: user_params[:sex],
      grade: user_params[:grade],
      faculty: user_params[:faculty],
      department: user_params[:department]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render 'step3'
    end
  end

  def done

  end


  def validates_step1
    session[:university_id] = user_params[:university_id]
    @user = User.new(
      university_id: session[:university_id],
      email: "xxxxxx@xxxxx",
      password: "password",
      password_confirmation: "password",
      nickname: "ウィフレ",
      lastname: "ウィフレ",
      firstname: "太郎",
      birth_date: "2000-01-01",
      sex: 0,
      grade: 1,
      faculty: "ウィフレ",
      department: "友達学科"
    )
    render 'step1' unless @user.valid?
  end

  def validates_step2
    session[:email] = user_params[:email_account] + session[:domain]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new(
      university_id: 1,
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      nickname: "ウィフレ",
      lastname: "ウィフレ",
      firstname: "太郎",
      birth_date: "2000-01-01",
      sex: 0,
      grade: 1,
      faculty: "ウィフレ",
      department: "友達学科"
    )
    render 'step2' unless @user.valid?
  end

  private
  def user_params
    params.require(:user).permit(
      :university_id, :email_account, :email, :password, :password_confirmation,
      :nickname, :lastname, :firstname, :birth_date,
      :sex, :grade, :faculty, :department
    )
  end


  protected

  #def after_inactive_sign_up_path_for(resource)
    #edit_user_registration_path(resource)
  #end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
