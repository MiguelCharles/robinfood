class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy, :add_to_order]
  def index
    # @q = Promotion.search(params[:q])
    @promotions = Promotion.all.order(:validity)
      @hash = Gmaps4rails.build_markers(@promotions) do |promo, marker|
        marker.lat promo.shop.latitude
        marker.lng promo.shop.longitude
    end
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save!
      redirect_to promotion_path(@promotion)
    else
      render :new
    end
  end

  def edit
  end

  def update
     if @promotion.update(promotion_params)
      redirect_to promotions_path
    else
      render :edit
    end
  end

  def destroy
    @promotion.destroy
    redirect_to promotions_path
  end

  def add_to_order
    order = Order.create(promotion: @promotion)
    if current_user
      current_user << order
    else
      if session[:order_ids]
        session[:order_ids] << order.id
      else
        session[:order_ids] = [order.id]
      end
    end
  end

  private

    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(:shop_id, :title, :product_type, :initial_quantity, :unit, :initial_price_per_unit, :price_after_promotion_per_unit, :remaining_quantity, :promotion_status, :digits_code, :validity)
    end
end
