class HumanResourcesController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]

def requests
  @requests = Request.where(status: "pending")
end

def update_request_status
  @req = Request.find(params[:id])
  status = Request.statuses.key(params[:status].to_i)
#  request = {}
  if status == "approved"
    @req.user.update( first_name: @req.first_name, last_name: @req.last_name, age: @req.age, birthdate: @req.birthdate, email: @req.email, image: @req.image )
    @req.approved!
  #  request[:message] = "Request successfully updated!"
  #  redirect_to requests_human_resources_path
    sweetalert_success('Click OK to exit.', 'Request successfully updated.', persistent: 'OK')
  else
    @req.destroy
  #  request[:message] = "Request declined!"
    sweetalert_success('Click OK to exit.', 'Request declined!.', persistent: 'OK')
  end
#  render json: request
end

def index
  @users = User.all
end

def show
  @user = User.find_by(id:params[:id])
end

def newz
  @user = User.new
end

def create
  @user = User.new(sign_up_params)
    if @user.save
      redirect_to human_resources_path
    end
end

def edit
  @user = User.find_by(id:params[:id])
end

def update
  @user = User.find_by(id:params[:id])
    if @user.update(sign_up_params)
    flash[:success] = "Update Successfully!!!"
    redirect_to human_resources_path
  else
    render "edit"
  end
end

def destroy
  @user = User.find_by(id:params[:id])
    if @user.destroy
      redirect_to human_resources_path
    end
end

private

def sign_up_params
  params.require(:user).permit(:first_name, :last_name, :age, :birthdate, :role, :email, :password, :password_confirmation, :image)
end



def user_params
  params.require(:user).permit(:first_name, :last_name, :age, :birthdate, :role, :email, :password, :image, :status, :status_type)
end

end
