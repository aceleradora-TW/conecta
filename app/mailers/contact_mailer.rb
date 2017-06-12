require 'action_mailer'
ActionMailer::Base.view_paths = File.expand_path('../../../app/views/', __FILE__)

class Mailer < ActionMailer::Base
  default to: "aceleradora11@gmail.com"
  default from: "aceleradora11@gmail.com"

  def send_email_contact
    mail(
      to: "aceleradora11@gmail.com", :from    => "aceleradora11@gmail.com", :subject => "Dale",
      :template_path => "app/views/mailer", template_name: 'notification') do |format|
      format.html { render 'notification' }
      format.text { render plain: 'notification' }
    end
  end
end
