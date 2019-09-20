class UsersController < ApplicationController

before_filter :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
    @establishments = Establishment.all
  end

  def show    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      #redirect_to @user

      respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully updated.' }
      format.json { head :no_content }
    end

    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    #redirect_to user_path
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :surname, :email, :role, :establishment_id, :password , :encrypted_password, :unique_code)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
