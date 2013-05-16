class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @comment=Comment.new
  end

  def create
    comment=Comment.new
    comment.attributes=(params[:comment])
    if comment.save!
      redirect_to '/answer/ab00861d9b31522ad232ae75d669a016', :notice => "Your comment added successfully."
    else
      redirect_to :nothing => true, :notice => "Your comment add is fail."
    end
  end
end