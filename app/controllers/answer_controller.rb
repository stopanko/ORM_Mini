class AnswerController < ApplicationController
  def index
    @answer = UserRequest.find_by_code(params[:page])
    if @answer.nil?
      redirect_to "/404.html"
    end
    @comments = Comment.find_all_by_userRequest_id(@answer.id)
  end
end