class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true

  # メッセージを既読に変更する
  def self.update_read_flag(messages, user_id)
    messages.each do |message|
      if message.user_id != user_id
        message.read_flag = true
        message.save
      end
    end
  end
end
