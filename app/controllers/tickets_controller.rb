class TicketsController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, :tickets, :message => 'Access denied.'
    if params[:page].nil?
      params[:page] = Status.all.first.link
    end
    @status = Status.find_by_link(params[:page])
    if @status.nil?
      redirect_to "/404.html"
    end
  end
end
