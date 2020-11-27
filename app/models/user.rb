class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_hobbies, dependent: :destroy
  has_many :hobbies, through: :user_hobbies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  belongs_to :university

  mount_uploader :image, ImageUploader

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
  validates_acceptance_of :agreement, allow_nil: false, message: "利用規約とプライバシーポリシーに同意してください", on: :create


  attr_accessor :current_password

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # メッセージ機能
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
