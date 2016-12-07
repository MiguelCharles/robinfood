class ShopsController < ApplicationController
before_action :set_shop, only: [:show, :edit, :update, :destroy]
  def index
    @shops = Shop.all
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
  Shop.create(shop_params)
  redirect_to promotions_path
  end

  def edit
  end

  def update
  @shop.update(shop_params)
  redirect_to promotions_path
  end

  def destroy
    @shop.destroy
  end

private
  def shop_params
  params.require(:params).permit(:user_id, :name_of_the_store, :category, :description, :phone_number, :VAT_number)
end

def set_shop
  @shop = Shop.find(params[:id])
end
end
