class CommentsController < OpenReadController

  before_action :set_lines

  def index
    @comments = @line.comments
    render json: @comments
  end

  def show
    @comment = @line.comments.find(params[:id])
    render json: @comment
  end

  def create
    @comment = @line.comments.build(comment_params)

    @comment.user = current_user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post, :emoji)
  end

  def set_lines
    # create an instance variable that can be accessed in
    # every action.
    @line = Line.find(params[:line_id])
  end

end
