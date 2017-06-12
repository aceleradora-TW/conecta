EmailDataFrom = Struct.new(:name, :email,:text)
EmailDataTo = Struct.new(:name, :email)

class EmailData
  attr_accessor :from, :to, :subject
  def initialize(from_name, from_email, from_text, to_name, to_email, subject)
    @from = EmailDataFrom.new(from_name, from_email, from_text)
    @to = EmailDataTo.new(to_name, to_email)
    @subject = subject
  end
end
