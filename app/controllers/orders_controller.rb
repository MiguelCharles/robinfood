class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :destroy, :add_to_order]
#  before_action :authenticate_user!
  def index

    @orders = current_user.orders.order(:updated_at) #maybe better to order by status
  end

  def show

     @hash = Gmaps4rails.build_markers(@order) do |order, marker|
        marker.lat order.promotion.shop.latitude
        marker.lng order.promotion.shop.longitude
      end
  end

  def new
    @order = Order.new
  end

  def create
    if current_user
      @order = Order.new(order_params)
       @order.user_id = current_user.id
      @order.status = "To be confirmed"
      @order.save!
           redirect_to orders_path

    else
      @order = Order.new(order_params)
      @order.save!
      redirect_to new_user_session_path
    end
  end


  def edit

  end

  def update
    if current_user
      @order = Order.find(params[:id])
      @order.update!(order_params)
           redirect_to orders_path

    else
       @order = Order.new(order_params)
      @order.save!
      redirect_to new_user_session_path
    end
  end

  def destroy

  end

  def orders_from_user(user)
    @orders_user = Order.where(@order.user_id = user)
  end

  def confirm
    @order = Order.find(params[:id])
    code =  (params[:confirm]["code"]).to_i
    if @order.promotion.digits_code == code
      @order.status = "Picked-up"
      @order.save!
      flash[:notice] = "Promotion Validated - Here is your coupon"
      redirect_to order_path(@order.id)
    else
      flash[:alert] = "Invalid Promotion Code!"
      redirect_to order_path(@order.id)
    end
  end

private

def set_order
  @order = Order.find(params[:id])
end

def order_params
  params.require(:order).permit(:promotion_id, :quantity_ordered)
end

end

  # def add_to_order
  #   order = Order.create(promotion: @promotion)
  #   if current_user
  #     current_user << order
  #   else
  #     if session[:order_ids]
  #       session[:order_ids] << order.id
  #     else
  #       session[:order_ids] = [order.id]
  #     end
  #   end
  # end
