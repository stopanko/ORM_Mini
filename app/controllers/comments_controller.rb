class CommentsController < ApplicationController
  def index
    @comment=Comment.new
  end

  def create
    comment=Comment.new
    comment.attributes=(params[:comment])
    if comment.save!
      answer=comment.userRequest
      if params[:status_id]!=nil and answer.status.id != params[:status_id]
        answer.status=Status.find(params[:status_id])

        answer.save!
      end
      UserMailer.ticket_answer_comment_successfully_email(answer).deliver
      redirect_to '/answer/'+answer.code, :notice => "Your comment added successfully."
    else
      redirect_to :nothing => true, :notice => "Your comment add is fail."
    end
  end
end