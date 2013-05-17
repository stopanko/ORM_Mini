class UserRequestsController < ApplicationController

  def index
    @user_request=UserRequest.new
  end

  def create
    user_request=UserRequest.new
    user_request.attributes = params[:user_request]
    user_request.status_id=Status.find_by_link('new').id
    user_request.code=Digest::MD5.hexdigest(Time.now.to_s+user_request.email)
    if user_request.save!
      UserMailer.ticket_send_successfully_email(user_request).deliver
      redirect_to user_requests_path, :notice => "Ticket send successfully."
    else
      redirect_to user_requests_path, :notice => "Ticket send fail."
    end
  end

end
