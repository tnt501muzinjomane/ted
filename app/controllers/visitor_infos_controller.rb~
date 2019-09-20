class VisitorInfosController < ApplicationController
  before_action :set_visitor_info, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  respond_to :html


  def index
     
     @user = User.where(:id =>  params[:search])
     @users = User.all

    
     @t = VisitorInfo.select('DISTINCT travel')
     @r = VisitorInfo.all 

    
     if params[:search] == ''
    
      @visitor_infos = VisitorInfo.where({date_of_arrival: (params[:start_date]).. (params[:end_date])} || {travel: params[:travel] }).paginate(:page => params[:page], :per_page => 500)

      else
     @visitor_infos = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).paginate(:page => params[:page], :per_page => 500)
   
       
    respond_to do |format|
    format.html
    format.csv { send_data @r.to_csv, filename: "visitors-#{Date.today}.csv" }
  
  	end
     end
  end

  def show
    respond_with(@visitor_info)
  end

  def new
    @visitor_info = VisitorInfo.new
    respond_with(@visitor_info)
  end

  def edit
  end

  def create
    @visitor_info = VisitorInfo.new(visitor_info_params)
    @visitor_info.save
    respond_with(@visitor_info)
  end

  def update
    @visitor_info.update(visitor_info_params)
    respond_with(@visitor_info)
  end

  def destroy
    @visitor_info.destroy
    respond_with(@visitor_info)
  end

  private
    def set_visitor_info
      @visitor_info = VisitorInfo.find(params[:id])
    end

    def visitor_info_params
      params.require(:visitor_info).permit(:name, :surname, :date_of_arrival, :reason_for_vist, :mode_of_transport, :gender, :travel, :partner, :citizenship, :country, :user_id, :Below_18, :age18_24, :age25_34, :age35_44, :age45_54, :age55_64, :age65, :male, :female)
    end
  def sort_column
    VisitorInfo.column_names.include?(params[:sort]) ? params[:sort] : "country"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
