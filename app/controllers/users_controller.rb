class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user! # Only for signed in users

  def show
    authorize @user # Can only see your own profile
  end

  def edit
    authorize @user # Can only modify your own profile
  end

  def update
    authorize @user # Can only modify your own profile
    if @user.update(user_params)
      @user.save!
      flash[:notice] = t('flash.edit-user')
      redirect_to promotions_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :address, :facebook_picture_url, :facebook_picture_url_cache) #TODO Check Strong parameters and what it does
  end

  def set_user
    @user = User.find(params[:id])
  end
end
