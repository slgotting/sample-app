class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_url(@user)
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_editable)
    render 'edit'
  end
  

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_editable
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
