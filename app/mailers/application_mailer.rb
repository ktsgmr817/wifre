class ApplicationMailer < ActionMailer::Base
  default from: 'wifre.info@gmail.com',
          repry_to: 'wifre.info@gmail.com'
  layout 'mailer'
end
