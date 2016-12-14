class PromotionsController < ApplicationController
  include Pundit

  # Pundit: white-list approach.
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]
  # after_action :verify_policy_scoped, only: [:update], unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def index
    if params[:address]
      @address = params[:address]
      @shops = Shop.near(@address, 10).joins(:promotions)
      @ids = @shops.to_a.map(&:id).uniq
      @promotions = @shops.any? ? Promotion.where(shop_id: @ids) : []
    else
      @promotions = Promotion.all.order(:validity)
    end
    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
    end
  end

  def show

    @order = Order.find_or_initialize_by(promotion_id: params[:id])
    @promotion_coordinates = Gmaps4rails.build_markers([@promotion]) do |promo, marker|
      marker.lat promo.shop.latitude
      marker.lng promo.shop.longitude
  end

end

  def new
    @promotion = Promotion.new
    authorize @promotion
  end

  def create
    # @promotion = current_user.shops[0].promotions.build(promotion_params)
    @promotion = Promotion.new(promotion_params)
    @promotion.digits_code = 2432
    @promotion.promotion_status = true
    @promotion.shop = Shop.find_by(user: current_user)
    @promotion.save
    if @promotion.save!
      redirect_to shop_promotions_path(@promotion.shop)
    else
      render :new
    end
  end

  def edit
  end

  def update
     if @promotion.update(promotion_params)
      @promotion.save!
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
    authorize @promotion
  end

  def promotion_params
    params.require(:promotion).permit(:shop_id, :title, :product_type, :initial_quantity, :unit, :initial_price_per_unit, :price_after_promotion_per_unit, :remaining_quantity, :promotion_status, :digits_code, :validity)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
