class CommentsController < ApplicationController

  def index
    @comment = Comment.new
    @prototype = Prototype.find(params[:id])
  end

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    @comments = @prototype.comments.all
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}"
    else
  #     # @prototype = @comment.prototype
  #     # @comments = @prototype.comments
      render "prototypes/show"
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
