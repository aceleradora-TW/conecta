require 'action_mailer'
ActionMailer::Base.view_paths = File.expand_path('../../../app/views/', __FILE__)

class Mailer < ActionMailer::Base
  default to: "aceleradora11@gmail.com"
  default from: "aceleradora11@gmail.com"

  def create_email(email_data, template_path,template_name)
    mail(
       to: email_data.to.email, from: email_data.from.email, subject: email_data.subject,
       template_path: template_path, template_name: template_name) do |format|
         format.html { render template_name, locals: {email_data: email_data}}
       end
  end
end
