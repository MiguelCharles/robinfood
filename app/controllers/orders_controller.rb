class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all.order(:updated_at)
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
  end

  def destroy
  end

private

def set_order
@order = Order.find(params[:id])
end

end
