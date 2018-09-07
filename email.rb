require 'pony'
require 'dotenv/load'

class Email
  attr_reader :name, :email
  
  def initialize(name, email)
    # binding.pry
    @options = options
    @name = name
    @email = email
  end

  def send_email
    # binding.pry
    Pony.mail(message)
  end

  private
  def options
    Pony.options = { 
      :via => 'smtp',
      :via_options => {
        :address => 'smtp.mailgun.org',
        :port => '587',
        :enable_starttls_auto => true,
        :authentication => :plain,
        :user_name => ENV['DEFAULT_SMTP_LOGIN'], # This is the Default SMTP Login from earlier
        :password => ENV['DEFAULT_PASSWORD'] # This is your Default Password
      }
    }
  end

  def message
    message = {
      :from => 'hello@example.com',
      :to => "Recipient Name Goes Here <#{email}>",
      :subject => "Welcome #{name}!",
      :body => 'Thanks for signing up to our awesome newsletter!'
    }
  end
end