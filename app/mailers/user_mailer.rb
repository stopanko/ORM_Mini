class UserMailer < Devise::Mailer
  default :from => 'orm1mini@gmail.com'

  def role_change_email(user)
    @user = user
    @url = 'http://0.0.0.0:3000/users/sign_in'
    mail(:to => user.email, :subject => "Welcome to My ORM MINI Site")
  end

  def ticket_send_successfully_email(user_request)
    @user = user_request
    @url = 'http://0.0.0.0:3000/answer/'+@user.code
    mail(:to => user_request.email, :subject => "Welcome to My ORM MINI Site")
  end
end
