class ApplicationMailer < ActionMailer::Base
  default from: %("testGuru" <evgeni.valentino@gmail.com>)
  layout 'mailer'
end
