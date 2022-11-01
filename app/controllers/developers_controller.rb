class DevelopersController < ApplicationController
  before_action :set_developer, only: %i[ show update destroy ]
  before_action :authenticate_account!, only: %i[ new edit create update ]
  before_action :redirect_if_account_already_has_a_developer, only: %i[new]

  def index
    @developers = if params[:search].present?
                    Search.create_new(params[:search])
                    Search.results(params[:search])
                  else
                    Developer.visible
                  end
  end

  def show
    redirect_to developers_path, notice: t('developers.redirects.invisible') if @developer.invisible?
  end

  def new
    @developer = Developer.new
  end

  def edit
    @developer = current_account.developer
    @image_required = !@developer.profile_picture.present?
  end

  def create
    @developer = current_account.build_developer(developer_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to developer_url(@developer), notice: "Din udvikler profil blev oprettet" }
      else
        p @developer.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_account.developer.update(developer_params)
        format.html { redirect_to developer_url(@developer), notice: "Din udvikler profil blev opdateret" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_account.developer.destroy

    respond_to do |format|
      format.html { redirect_to developers_url, notice: "Din udvikler profil blev slettet" }
    end
  end

  private

    def redirect_if_account_already_has_a_developer
      redirect_to developer_path(current_account.developer) if current_account.developer
    end

    def set_developer
      @developer = Developer.friendly.find(params[:id])
    end

    def developer_params
      params.require(:developer).permit(:profile_picture, :title, :about, :city, :first_name, :last_name, :website, :github, :search_status, :allow_notifications, role_levels: [], programming_languages: [], role_types: [])
    end
end
