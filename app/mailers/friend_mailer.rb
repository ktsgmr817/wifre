class FriendMailer < ApplicationMailer

  def send_when_requested(user)
    @user = user
    mail to: user.email,
         subject: 'フレンド申請が届きました！'
  end
end
