class DevelopersController < ApplicationController
  before_action :set_developer, only: %i[ show edit update destroy ]

  def index
    @developers = Developer.all
  end

  def show
  end

  def new
    @developer = Developer.new
  end

  def edit
  end

  def create
    @developer = Developer.new(developer_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to developer_url(@developer), notice: "Developer was successfully created." }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to developer_url(@developer), notice: "Developer was successfully updated." }
        format.json { render :show, status: :ok, location: @developer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @developer.destroy

    respond_to do |format|
      format.html { redirect_to developers_url, notice: "Developer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_developer
      @developer = Developer.find(params[:id])
    end

    def developer_params
      params.require(:developer).permit(:profile_picture, :title, :about, :city, :first_name, :last_name, :website, :github, :role_types, :search_types, :allow_notifications)
    end
end
