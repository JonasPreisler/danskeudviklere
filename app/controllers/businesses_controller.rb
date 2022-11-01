class BusinessesController < ApplicationController
  before_action :set_business, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, only: %i[ new edit create update ]
  before_action :redirect_if_account_already_has_a_developer, only: %i[new]

  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = Business.new
  end

  def edit
    @business = current_account.business
    @image_required = !@business.logo.present?
  end

  def create
    @business = current_account.build_business(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to business_url(@business), notice: "Din virksomheds profil blev oprettet" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_account.business.update(business_params)
        format.html { redirect_to business_url(@business), notice: "Din virksomheds profil blev opdateret" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_account.business.destroy

    respond_to do |format|
      format.html { redirect_to businesses_url, notice: "Din virksomheds profil blev slettet" }
    end
  end

  private

    def redirect_if_account_already_has_a_developer
      redirect_to business_path(current_account.business) if current_account.business
    end
    
    def set_business
      @business = Business.friendly.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:name, :about, :website, :logo)
    end
end
