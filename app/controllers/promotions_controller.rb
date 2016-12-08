class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]
  def index
    # @q = Promotion.search(params[:q])
    @promotions = Promotion.all.order(:validity)
      @hash = Gmaps4rails.build_markers(@promotions) do |promo, marker|
        marker.lat promo.shop.latitude
        marker.lng promo.shop.longitude
    end
  end

  def show
    @order = Order.find_or_initialize_by(promotion_id: params[:id], user_id: current_user.id)
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    @promotion.shop = Shop.find_by(user: current_user)
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


  private

    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(:shop_id, :title, :product_type, :initial_quantity, :unit, :initial_price_per_unit, :price_after_promotion_per_unit, :remaining_quantity, :promotion_status, :digits_code, :validity)
    end
end
