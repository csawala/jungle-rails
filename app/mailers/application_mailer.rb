class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.ca"
  layout 'mailer'
end
