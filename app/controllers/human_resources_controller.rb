class HumanResourcesController < ApplicationController

def index
  @user = User.all
end

def show
  @user = User.find_by(id:params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(sign_up_params)
    if @user.save
      redirect_to root_path
    end
end

def edit
  @user = User.find_by(id:params[:id])
end

def update
  @user = User.find_by(id:params[:id])
    if @user.update(sign_up_params)
      redirect_to root_path
    else
      render "edit"
    end
end

def destroy
  @user = User.find_by(id:params[:id])
    if @user.destroy
      redirect_to root_path
    end
end

private

def sign_up_params
  params.require(:user).permit(:first_name, :last_name, :age, :birthdate, :email, :password, :password_confirmation)
end

def account_update_params
  params.require(:user).permit(:first_name, :last_name, :age, :birthdate, :email, :password, :password_confirmation, :current_password)
end

end
