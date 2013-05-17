class StatusesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @statuses=Status.all
  end

  def change
    status= Status.find(params[:id])
    status.link=params[:link]
    status.name=params[:name]
    status.save
    render :nothing => true
  end

  def delete
    status= Status.find(params[:id])
    status.destroy
    render :nothing => true
  end

  def create
    status=Status.new(:name => params[:name], :link => params[:link])
    status.save
    render :text => status.id.to_s
  end

  def close_ticket
    user_request=UserRequest.find(params[:user_request_id])
    user_request.status=Status.find_by_link('close')
    user_request.save
    redirect_to '/answer/'+user_request.code
  end

end
