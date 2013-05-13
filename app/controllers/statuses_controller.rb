class StatusesController < ApplicationController
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
end