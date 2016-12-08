class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :destroy, :add_to_order]
  def index
    @orders = Order.all.order(:updated_at) #maybe better to order by status
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    if current_user.present?
      @order = Order.new(order_params)
       @order.user_id = current_user.id
      @order.status = "To be confirmed"
      @order.save!
    end
    redirect_back(fallback_location: promotion_path(params[:order][:promotion_id]))
  end


  def edit

  end

  def update
    if current_user.present?
      @order = Order.find(params[:id])
      @order.update!(order_params)
    end
    redirect_back(fallback_location: promotion_path(params[:order][:promotion_id]))
  end

  def destroy

  end

  def orders_from_user(user)
    @orders_user = Order.where(@order.user_id = user)
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
