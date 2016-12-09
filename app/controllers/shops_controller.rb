class ShopsController < ApplicationController
before_action :set_shop, only: [:show, :edit, :update, :destroy]
  def index
    # @shops = Shop.all
    @shops = Shop.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
  end

  def new
    @shop = Shop.new
  end

  def create
  Shop.create(shop_params)
  redirect_to promotions_path
  end

  def promotions
    @promotions = Promotion.joins(:shop).where("shops.user_id = ?", current_user.id)
      @hash = Gmaps4rails.build_markers(@promotions) do |promo, marker|
        marker.lat promo.shop.latitude
        marker.lng promo.shop.longitude
    end

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
