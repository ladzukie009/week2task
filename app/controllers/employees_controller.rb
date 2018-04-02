class EmployeesController < ApplicationController

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
    @user = User.new(user_params)
      if @user.save
        redirect_to employees_path
      end
  end
  def edit
    @user = User.find_by(id:params[:id])
  end
  def update
    @user = User.find(params[:id])
    @req = Request.new(user_params.merge(user_id: current_user.id))
      redirect_to employees_path
  end
  def destroy
    @user = User.find_by(id:params[:id])
      if @user.destroy
        redirect_to employees_path
      end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :birthdate, :role, :email, :password, :image)
  end
end
