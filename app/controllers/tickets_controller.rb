class TicketsController < ApplicationController
  before_filter :initialize

  def initialize
    @tickets=[]
  end

  def show
    @status=Status.find_by_link(params[:page])
    if @status==nil
      return redirect_to "/404.html"
    end
    @tickets=UserRequest.find_all_by_status_id(@status)
    render :action => 'index'
  end
end
