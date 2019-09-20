class ReasonsController < ApplicationController
  before_action :set_reason, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reasons = Reason.all
    respond_with(@reasons)
  end

  def show
    respond_with(@reason)
  end

  def new
    @reason = Reason.new
    respond_with(@reason)
  end

  def edit
  end

  def create
    @reason = Reason.new(reason_params)
    @reason.save
    respond_with(@reason)
  end

  def update
    @reason.update(reason_params)
    respond_with(@reason)
  end

  def destroy
    @reason.destroy
    respond_with(@reason)
  end

  private
    def set_reason
      @reason = Reason.find(params[:id])
    end

    def reason_params
      params.require(:reason).permit(:reason, :nump, :citizen, :user_id)
    end
end
