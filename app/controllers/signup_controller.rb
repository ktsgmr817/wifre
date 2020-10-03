class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3

  def step1
    @user = User.new
  end

  def step2
    session[:university] = user_params[:university]
    @user = User.new
  end

  def step3
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
  @user = User.new
  end

  def create
    @user = User.new(
      university: session[:university],
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
      render '/signup/step3'
    end
  end

  def done
      sign_in User.find(session[:id]) unless user_signed_in?
  end


  def validates_step1
    session[:university] = user_params[:university]
    @user = User.new(
      university: session[:university],
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
    render '/signup/step1' unless @user.valid?
  end

  def validates_step2
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new(
      university: "ウィフレ大学",
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
    render '/signup/step2' unless @user.valid?
  end

  private
  def user_params
    params.require(:user).permit(
      :university, :email, :password, :password_confirmation,
      :nickname, :lastname, :firstname, :birth_date,
      :sex, :grade, :faculty, :department
    )
  end
end
