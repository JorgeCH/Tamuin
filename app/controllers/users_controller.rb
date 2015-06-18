class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]  

  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have signed up successfully."
      redirect_to "/"
    else
      flash.now[:alert] = "El usuario no ha sido creado."
      render :action => "new"
    end
  end

  def show
   
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update(user_params)
      flash[:notice] = "El Usuario se ha modificado."
      redirect_to @user
    else
      flash[:alert] = "El Usuario no ha sido modificado."
      render action: "edit"
    end
  end

  def destroy

  end
    
  private
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
       @user = User.find(params[:id])
    end 
end
