class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(comment_params)#(params[:comment])
    #redirect_to user_url(@user)#micropost_path(@micropost)
    redirect_to request.referrer || root_url
  end

  private
  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
