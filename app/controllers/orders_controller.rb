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

  end


  def edit

  end

  def update
    if current_user.present?
      @order = Order.find_or_create_by(promotion_id: params[:promotion_id], user_id: current_user.id)
      @order.user_id = current_user.id
      @order.status = "To be confirmed"
      @order.quantity_ordered += params[:quantity_ordered].to_i
      @order.save!
    end

    redirect_back(fallback_location: promotion_path(params[:promotion_id]))
  end

  def destroy

  end

private

def set_order
  @order = Order.find(params[:id])
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
