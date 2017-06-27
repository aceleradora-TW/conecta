require 'action_mailer'

configure do
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.default :charset => "utf-8"
  ActionMailer::Base.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           => 587,
    :domain         => 'gmail.com',
    :authentication => :plain,
    :user_name      => 'aceleradora11@gmail.com',#ENV['GMAIL_USER'],
    :password       => 'geoprocessamentotw',#ENV['GMAIL_PASSWORD'],
    :enable_starttls_auto => true
  }
end
