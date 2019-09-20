class PartnershipsController < ApplicationController
  before_action :set_partnership, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @partnerships = Partnership.all
    respond_with(@partnerships)
  end

  def show
    respond_with(@partnership)
  end

  def new
    @partnership = Partnership.new
    respond_with(@partnership)
  end

  def edit
  end

  def create
    @partnership = Partnership.new(partnership_params)
    @partnership.save
    respond_with(@partnership)
  end

  def update
    @partnership.update(partnership_params)
    respond_with(@partnership)
  end

  def destroy
    @partnership.destroy
    respond_with(@partnership)
  end

  private
    def set_partnership
      @partnership = Partnership.find(params[:id])
    end

    def partnership_params
      params.require(:partnership).permit(:partnership, :nump, :citizen, :user_id, :rdate, :visitor_id)
    end
end
