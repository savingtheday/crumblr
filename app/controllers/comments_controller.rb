class CommentsController < ApplicationController
    def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "success"
      redirect_to comment_path @comment
    else
      flash[:alert] = "Didn't work"
      redirect_to 'comment/new'
    end
  end
  def show
    @comment = get_comment
  end

  def update
    @comment = get_comment

    @comment_update = @comment.update(params[:comment])
    if @comment_update
        flash[:notice] = "success"
        redirect_to comment_path @comment
      else
        flash[:alert] = "Didn't work"
        redirect_to comment_path @comment
      end
  end

  def edit
    @comment = get_comment
  end

  def get_comment
    Comment.find(params[:id])
  end

end
