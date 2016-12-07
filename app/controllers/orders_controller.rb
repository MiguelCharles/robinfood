class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all.order(:updated_at) #maybe better to order by status
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new()

  # order = Order.find(params[:order_id])
  #   order.buyer_id = params[:user_id]
  #   order.status = "To be confirmed"
  #   order.save!
  #   promotion = Promotion.find(params[:promotion_id])
  #   @orderline = OrderLine.create(order_id: order.id, promotion_id: promotion.id, status: "To be confirmed")
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

def set_order
@order = Order.find(params[:id])
end

end
