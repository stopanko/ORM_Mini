class UserMailer < Devise::Mailer
  default :from => 'orm1mini@gmail.com'

  def role_change_email(user)
    @user = user
    @url = 'http://0.0.0.0:3000/users/sign_in'
    mail(:to => user.email, :subject => "Welcome to My ORM MINI Site")
  end
end
