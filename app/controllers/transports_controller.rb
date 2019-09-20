class TransportsController < ApplicationController
  before_action :set_transport, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @transports = Transport.all
    respond_with(@transports)
  end

  def show
    respond_with(@transport)
  end

  def new
    @transport = Transport.new
    respond_with(@transport)
  end

  def edit
  end

  def create
    @transport = Transport.new(transport_params)
    @transport.save
    respond_with(@transport)
  end

  def update
    @transport.update(transport_params)
    respond_with(@transport)
  end

  def destroy
    @transport.destroy
    respond_with(@transport)
  end

  private
    def set_transport
      @transport = Transport.find(params[:id])
    end

    def transport_params
      params.require(:transport).permit(:trans, :nump, :citizen, :user_id, :rdate, :visitor_id)
    end
end
