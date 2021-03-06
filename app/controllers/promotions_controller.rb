class PromotionsController < ApplicationController
  include Pundit

  # Pundit: white-list approach.
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

# Flash notification when trying an action for which the user is not authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = t('flash.authorization')
    redirect_to(root_path)
  end

  def index
    @params_search = false
    if params[:address] # Retrieve geographically close promotions
      @params_search = true
      @address = params[:address]
      shops = category_filter()
      @shops = shops.near(@address, 10).joins(:promotions)
      @ids = @shops.to_a.map(&:id).uniq
      @promotions = @shops.any? ? Promotion.where(shop_id: @ids) : []
      unless @promotions.empty?
        @promotions = @promotions.where(promotion_status: true).where('validity >= ?', Time.now)
      end

    else # No address filled in
      @shops = category_filter()
      time = Time.now
      shops_ids = @shops.to_a.map(&:id).uniq
      @promotions = @shops.any? ? Promotion.where(shop_id: @ids) : []
      @promotions = Promotion.where("shop_id in (?)", shops_ids).where(promotion_status: true).where('validity >= ?', Time.now).order(:validity)
    end

    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
    end

    respond_to do |format| # Pour gérer les requêtes AJAX en js
        format.js {}
        format.html
    end
  end

  def show
    if current_user
        @order = Order.find_or_initialize_by(promotion_id: params[:id], user: current_user)
        if @order.status == "Booked" || @order.status == "Picked-up"
          @order = Order.new
        end
    else
      @order = Order.new
    end
    @promotion_coordinates = Gmaps4rails.build_markers([@promotion]) do |promo, marker|
      marker.lat promo.shop.latitude
      marker.lng promo.shop.longitude
      @quantity = @order.quantity_ordered || @promotion.min_quantity
    end

  end

  def new # Authorized only to user who have shops
    @promotion = Promotion.new
    authorize @promotion
  end

  def create # Authorized only to user who have shops
    @promotion = Promotion.new(promotion_params)
    authorize @promotion
    @promotion.product_type = "Food"
    @promotion.digits_code = (1000..9999).to_a.sample
    @promotion.promotion_status = false
    @promotion.min_quantity = 1
    @promotion.photo_url = "shop.png"
    @promotion.shop = Shop.find_by(user: current_user)
    @promotion.save
    if @promotion.save!
      redirect_to shop_promotions_path(@promotion.shop)
    else
      render :new
    end
  end

  def edit
    authorize @promotion
  end

  def update
    authorize @promotion
    if @promotion.update(promotion_params)
      @promotion.save!
      redirect_to shop_promotions_path(@promotion.shop.id)
    else
      render :edit
    end
  end

  def destroy
    authorize @promotion
    @promotion.destroy
    redirect_to promotions_path
  end

  private

  def category_filter # Filter shops based on category
    if (params[:shop] && params[:shop][:category] && Shop.all.collect(&:category).include?(params[:shop][:category]))
      shops = Shop.where('category like ?', params[:shop][:category])
      @default_filter = params[:shop][:category]
    else
      shops = Shop.all
      @default_filter = 'All'
    end
    return shops
  end

  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  def promotion_params
    params.require(:promotion).permit(:shop_id, :title, :product_type, :initial_quantity, :unit, :initial_price_per_unit, :price_after_promotion_per_unit, :remaining_quantity, :promotion_status, :description, :digits_code, :validity, :photo_url, :photo_cache)
  end

end
