class UserMailer < Devise::Mailer
  default :from => 'orm1mini@gmail.com'

  def role_change_email(user)
    @user = user
    @url = "http://#{ENV['HOST']}/users/sign_in"
    mail(:to => user.email, :subject => "Welcome to My ORM MINI Site")
  end

  def ticket_send_successfully_email(user_request)
    template_email(user_request)
  end

  def ticket_answer_comment_successfully_email(user_request)
    template_email(user_request)
  end

  def ticket_status_change_email(user_request)
    template_email(user_request)
  end

  def template_email(user_request)
    @user = user_request
    @url = "http://#{ENV['HOST']}/answer/#{@user.code}"
    mail(:to => user_request.email, :subject => "Welcome to My ORM MINI Site")
  end
end
