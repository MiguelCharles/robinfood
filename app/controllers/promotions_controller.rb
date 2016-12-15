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
    @params_search = false
    if params[:address]
      @params_search = true
      @address = params[:address]
      @shops = Shop.near(@address, 10).joins(:promotions)
      @ids = @shops.to_a.map(&:id).uniq
      @promotions = @shops.any? ? Promotion.where(shop_id: @ids) : []
      unless @promotions.empty?
        @promotions = @promotions.where(promotion_status: true)
      end
    else
      @shops = Shop.all
      @promotions = Promotion.where(promotion_status: true).order(:validity)
    end
    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
    end
  end

  def show
if current_user
    @order = Order.find_or_initialize_by(promotion_id: params[:id], user: current_user)
  else
    @order = Order.new
  end
    @promotion_coordinates = Gmaps4rails.build_markers([@promotion]) do |promo, marker|
      marker.lat promo.shop.latitude
      marker.lng promo.shop.longitude
    @quantity = @order.quantity_ordered || @promotion.min_quantity
  end

end

  def new
    @promotion = Promotion.new
    authorize @promotion
  end

  def create
    # @promotion = current_user.shops[0].promotions.build(promotion_params)
    @promotion = Promotion.new(promotion_params)
    @promotion.description = @promotion.title + " - " + @promotion.product_type
    @promotion.digits_code = 2432
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
  end

  def update
    #  @until = params[:promotion][:until]

    # @promotion.validity = @until.to_i.days.from_now
     if @promotion.update(promotion_params)
      @promotion.save!
      redirect_to shop_promotions_path(@promotion.shop.id)
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
    params.require(:promotion).permit(:shop_id, :title, :product_type, :initial_quantity, :unit, :initial_price_per_unit, :price_after_promotion_per_unit, :remaining_quantity, :promotion_status, :description, :digits_code, :validity)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
