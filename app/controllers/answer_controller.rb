class AnswerController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => :controller

  def index
    @answer= UserRequest.find_by_code(params[:page])
    @comments=Comment.find_all_by_userRequest_id(@answer.id)
  end

end