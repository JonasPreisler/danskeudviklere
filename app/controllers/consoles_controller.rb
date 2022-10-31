class ConsolesController < ApplicationController
  before_action :set_console, except: [:new, :index]

  def new
    @console = Console.new
  end

  def show
  end

  def index
    @consoles =  if params[:manufacturer].present?
                  Console.where(manufacturer: params[:manufacturer])
                else
                  Console.all
                end

    # render json: { 'consoles': consoles.map(&:formatted_name) }
  end

  def create
    @console = Console.new(console_params)

    if @console.save
      redirect_to console_path(@console)
    end
  end

  private

  def set_console
    @console = Console.find(params[:id])
  end

  def console_params
    params.require(:console).permit(:manufacturer, :name)
  end

end