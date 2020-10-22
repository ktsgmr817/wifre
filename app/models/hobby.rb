class Hobby < ApplicationRecord
  has_many :user_hobbies, dependent: :destroy
  has_many :users, through: :user_hobbies
  accepts_nested_attributes_for :user_hobbies, allow_destroy: true
end
