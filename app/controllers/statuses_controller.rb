class StatusesController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, :statuses, :message => 'Access denied.'
    @statuses = Status.all
  end

  def change
    authorize! :change, :statuses, :message => 'Access denied.'
    status = Status.find(params[:id])
    if status.link != 'close' and status.link != 'new'
      status.link = params[:link]
      status.name = params[:name]
      status.save
      render :nothing => true
    else
      render :nothing => true, :status => 500
    end
  end

  def delete
    authorize! :delete, :statuses, :message => 'Access denied.'
    status = Status.find(params[:id])
    if status.link != 'close' and status.link != 'new'
      status.destroy
      render :nothing => true
    else
      render :nothing => true, :status => 500
    end

  end

  def create
    authorize! :create, :statuses, :message => 'Access denied.'
    status = Status.new(:name => params[:name], :link => params[:link])
    status.save
    render :text => status.id.to_s
  end

  def close_ticket
    authorize! :close_ticket, :statuses, :message => 'Access denied.'
    user_request = UserRequest.find(params[:user_request_id])
    user_request.status = Status.find_by_link('close')
    if user_request.save!
      UserMailer.ticket_status_change_email(user_request).deliver
      redirect_to "/answer/#{user_request.code}"
    end
  end

end
