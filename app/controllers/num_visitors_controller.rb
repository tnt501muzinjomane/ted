class NumVisitorsController < ApplicationController
  before_action :set_num_visitor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @num_visitors = NumVisitor.all
    respond_with(@num_visitors)
  end

  def show
    respond_with(@num_visitor)
  end

  def new
    @num_visitor = NumVisitor.new
    respond_with(@num_visitor)
  end

  def edit
  end

  def create
    @num_visitor = NumVisitor.new(num_visitor_params)
    @num_visitor.save
    respond_with(@num_visitor)
  end

  def update
    @num_visitor.update(num_visitor_params)
    respond_with(@num_visitor)
  end

  def destroy
    @num_visitor.destroy
    respond_with(@num_visitor)
  end

  private
    def set_num_visitor
      @num_visitor = NumVisitor.find(params[:id])
    end

    def num_visitor_params
      params.require(:num_visitor).permit(:visitor_infor_id, :numv)
    end
end
