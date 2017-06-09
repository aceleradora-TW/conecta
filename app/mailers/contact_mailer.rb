require 'action_mailer'

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_options = { host:'localhost', port: '3000' }
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default :charset => "utf-8"
ActionMailer::Base.smtp_settings = {
  :address        => "smtp.gmail.com",
  :port           => 587,
  :domain         => 'gmail.com',
  :authentication => :plain,
  :user_name      => "aceleradora11@gmail.com",
  :password       => "aceleradora11tw",
  :enable_starttls_auto => true
}
ActionMailer::Base.view_paths = File.expand_path('../../../app/views/', __FILE__)


class Mailer < ActionMailer::Base
  default to: "c.schallenberger1996@gmail.com"
  default from: "aceleradora11@gmail.com"

  def notification
    mail(
      # :to      => "g_meneguz@yahoo.com.br", :from    => "aceleradora11@gmail.com", :subject => "Dale",
      :to      => "xxx@xxx.com", :from    => "aceleradora11@gmail.com", :subject => "Dale",
      :template_path => "app/views/mailer",  template_name: 'notification') do |format|
      format.html { render 'notification' }
      format.text { render plain: 'notification' }
    end
  end
end

email = Mailer.notification
email.deliver
