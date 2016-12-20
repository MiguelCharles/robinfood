class ShopsController < ApplicationController
before_action :set_shop, only: [:show, :edit, :update, :destroy, :changestatus]
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

  end

  def new
    @shop = Shop.new()
  end

  def create
    if current_user
      @shop = Shop.new(shop_params)
      @shop.user_id = current_user.id
      @shop.save
    else
      @shop = Shop.new(shop_params)
      session[:shop] = shop_params
      @shop.save
    end
  redirect_to promotions_path
  end

  def promotions
    @promotions = Promotion.joins(:shop).where("shops.user_id = ?", current_user.id)
      @hash = Gmaps4rails.build_markers(@promotions) do |promo, marker|
        marker.lat promo.shop.latitude
        marker.lng promo.shop.longitude
    end
    @promotions_active = []
    @promotions.map do |prom|
      if prom.promotion_status == true
        @promotions_active << prom unless prom.nil?
      end
    end
     @promotions_inactive = []
     @promotions.each do |prom|
     if prom.promotion_status == false
        @promotions_inactive << prom unless prom.nil?
      end
     end
  end

  def changestatus
    promo = Promotion.find(params[:promo_id])
    promo.change_status
    promo.digits_code = 2432
    promo.save!
    redirect_to shop_promotions_path(@shop)
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
  params.require(:shop).permit(:name_of_the_store, :category, :description, :phone_number, :VAT_number, :address, :zip_code, :city, :country)
end

def set_shop
  @shop = Shop.find(params[:id])
end

end
