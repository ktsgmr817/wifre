class ApplicationMailer < ActionMailer::Base
  default from: 'shansenkantai@gmail.com',
          repry_to: 'shansenkantai@gmail.com'
  layout 'mailer'
end
