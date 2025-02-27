class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("support@playpixelforge.com", "PixelForge Support")
  layout "mailer"
end
