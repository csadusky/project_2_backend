class LinesController < AuthController

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
    # @line = Line.create(params);
    # if @line.save
    #   render json: @line
    # else
    #   render json: @line.errors
    # end
  end

  private
   def line_params
    params.require(:color, :directon)
  end
end
