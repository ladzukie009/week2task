class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
      if @user.save
        redirect_to employees_path
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
