class ApplicationMailer < ActionMailer::Base
  default from: '"Dev"<from@example.com>'
  layout 'mailer'
end
