class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable


  #step1
  validates :university, presence: true

  #step2
  validates :email, presence: true#, uniqueness: { case_sensitive: false }

  #step3
  validates :nickname, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :sex, presence: true
  validates :grade, presence: true
  validates :faculty, presence: true
  validates :department, presence: true


  attr_accessor :current_password
end
