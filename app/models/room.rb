class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy

    # 未読があったらtrue, 既読のみだったらfalseを返す
    def check_read_flag(user_id)
        messages = self.messages
        messages.each do |message|
            unless message.read_flag
                if message.user_id != user_id
                    return true
                end
            end
        end

        return false
    end
end
