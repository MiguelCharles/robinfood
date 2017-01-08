class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy, :changestatus]
  before_action :authenticate_user!, only: [:create, :new, :update, :destroy, :edit, :changestatus]

# Flash notification when trying an action for which the user is not authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = t('flash.authorization')
    redirect_to(root_path)
  end

### PUBLIC METHODS ###
  def index
      @params_search = false
    if params[:address]
      @params_search = true
      @address = params[:address]
      @shops = Shop.near(@address, 10)
    else
      @shops = Shop.where.not(latitude: nil, longitude: nil)# Why not showing all shops?

    end
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

### RESTRICTED METHODS ###

  def promotions # promotions admin page for shop level user / not a public index !
    @shop = Shop.find(params[:shop_id])
    authorize @shop # Only the user who owns the shop is authorized
    @promotions = Promotion.where("shop_id = ?", @shop.id)
    @hash = Gmaps4rails.build_markers(@promotions) do |promo, marker|
        marker.lat promo.shop.latitude
        marker.lng promo.shop.longitude
    end
    @promotions_active = []
    @promotions.map do |prom|
      if (prom.promotion_status == true && prom.validity > Time.now)
        @promotions_active << prom unless prom.nil?
      end
    end
     @promotions_inactive = []
     @promotions.each do |prom|
       if (prom.promotion_status == false || prom.validity < Time.now)
          @promotions_inactive << prom unless prom.nil?
       end
     end
  end

  def new
    authorize current_user
    @shop = Shop.new()
  end

  def create
    authorize current_user
    if current_user
      @shop = Shop.new(shop_params)
      @shop.user_id = current_user.id
      @shop.save
    else
      @shop = Shop.new(shop_params)
      session[:shop] = shop_params
      @shop.save
    end
  flash[:notice] = t('partner.flash')
  redirect_to promotions_path
  end

  def changestatus # Activate or de-activate a promo
    promo = Promotion.find(params[:promo_id])
    authorize promo # Only the user who owns the shop owning the promo is authorized
    promo.change_status
    promo.save!
    redirect_to shop_promotions_path(@shop)
  end


  def edit
    authorize @shop # Only the user who owns the shop is authorized
  end

  def update
    authorize @shop # Only the user who owns the shop is authorized
    @shop.update(shop_params)
    redirect_to promotions_path
  end

  def destroy
    authorize @shop # Only the user who owns the shop is authorized
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
