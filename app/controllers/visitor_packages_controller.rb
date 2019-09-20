class VisitorPackagesController < ApplicationController
  before_action :set_visitor_package, only: [:show, :edit, :update, :destroy]
    helper_method :sort_column, :sort_direction
  respond_to :html

  def index
 
  @user = User.where(:id =>  params[:search])
  @users = User.all

  if params[:search] == ''
 
     @visitor_packages = VisitorPackage.where('rdate BETWEEN ? AND ?', params[:start_date], params[:end_date])  
  
 else

  @visitor_packages = VisitorPackage.where('user_id = ? AND rdate BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date])


    #@visitor_packages = VisitorPackage.order(sort_column + " " + sort_direction)
    respond_with(@visitor_packages)
   end
  end

  def show


    render :csvfile
    respond_with(@visitor_package)
  end






    def csvfile

           require 'csv'
		
		CSV.open( file, 'w' ) do |writer|
		  @users = User.each do |c|
		    writer << [c.email, c.name, c.surname, c.user_id, c.role]
		  end
		end


       end 









  def new
    @visitor_package = VisitorPackage.new
    respond_with(@visitor_package)
  end

  def edit
  end

  def create
    @visitor_package = VisitorPackage.new(visitor_package_params)
    @visitor_package.save
    respond_with(@visitor_package)
  end

  def update
    @visitor_package.update(visitor_package_params)
    respond_with(@visitor_package)
  end

  def destroy
    @visitor_package.destroy
    respond_with(@visitor_package)
  end

  private
    def set_visitor_package
      @visitor_package = VisitorPackage.find(params[:id])
    end

    def visitor_package_params
      params.require(:visitor_package).permit(:visitor_infor_id, :package_id)
    end
 def sort_column
    VisitorPackage.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
