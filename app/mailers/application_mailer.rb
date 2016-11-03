class ApplicationMailer < ActionMailer::Base
  default from: 'shailja@gemsessence.com'
  # layout 'mailer'
  def send_email_for_friend_request(sender, receiver)
    @sender = sender
    @receiver = receiver
    mail(to: @receiver.email, subject: "email")
  end
end
  
    
   
