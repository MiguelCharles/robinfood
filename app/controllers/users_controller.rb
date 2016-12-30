class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
def show
end

def new
  @user = User.new
end

def create
  User.create(user_params)
  redirect_to promotions_path
end

def edit
end

def update
 if @user == current_user
    if @user.update(user_params)
      @user.save!
      flash[:notice] = t('flash.edit-user')
      redirect_to promotions_path
    else
      render :edit
    end
end
end

def destroy
  @user.destroy
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :address)
end

def set_user
  @user = User.find(params[:id])
end
end
