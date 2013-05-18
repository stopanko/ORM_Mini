class TicketsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => :controller

  def index
    if params[:page] == nil
      params[:page] = Status.all.first.link
    end
    @status = Status.find_by_link(params[:page])
    if @status == nil
      return redirect_to "/404.html"
    end
  end
end
