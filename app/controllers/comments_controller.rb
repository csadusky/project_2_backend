class CommentsController < ApplicationController

  before_action :set_lines

  def index
    @comments = @line.comments
    render json: @comments
  end

  def show
    @comment = @line.comments.find(params[:id])
    render json: @comment
  end

  private

  def comment_params
    params.require(:post).permit(:emoji)
    end
  end

