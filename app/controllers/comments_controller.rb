class CommentsController < ApplicationController

  def index
    redirect_to root_path
  end

  def create
    comment = Comment.new
    comment.attributes = (params[:comment])
    if comment.save!
      answer = comment.userRequest
      if params[:status_id] != nil and answer.status.id != params[:status_id]
        answer.status = Status.find(params[:status_id])
        UserMailer.ticket_status_change_email(answer).deliver
        answer.save
      end
      UserMailer.ticket_answer_comment_successfully_email(answer).deliver
      redirect_to "/answer/#{answer.code}", :notice => "Your comment added successfully."
    else
      redirect_to "/answer/#{answer.code}", :notice => "Your comment add is fail."
    end
  end
end