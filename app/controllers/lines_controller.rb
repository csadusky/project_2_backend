class LinesController < OpenReadController

  def index
    @lines = Line.all
    render json: @lines

  end

  def show
    @line = Line.find(params[:id])
    render json: @line
  end

  def create
    render json: {data: "REQUEST RECEIVED"}
  end

  private
   def line_params
    params.require(:name, :color, :directon)
  end
end
