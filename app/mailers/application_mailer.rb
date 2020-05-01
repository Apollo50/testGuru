class ApplicationMailer < ActionMailer::Base
  default from: %("testGuru" <mail@testguru.com>)
  layout 'mailer'
end
