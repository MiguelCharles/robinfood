class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :confirm, :destroy, :add_to_order]
  before_action :authenticate_user!

    def index
      unless session[:order].nil?
        @order = Order.new(session[:order])
        @order.user = current_user
        @order.status = "To be confirmed"
        @order.save!
        session[:order] = nil
      end
      @orders = current_user.orders.where(status: ["To be confirmed","Booked"]).order("updated_at DESC") #maybe better to order by status
    end

    def show
      if policy(@order).show?
        @order = Order.find(params[:id])
        @order.status = "Booked" unless @order.status == "Picked-up"
        @order.save!
        @hash = Gmaps4rails.build_markers(@order) do |order, marker|
          marker.lat order.promotion.shop.latitude
          marker.lng order.promotion.shop.longitude
        end
      end
      authorize @order
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
        session[:order] = order_params
        redirect_to new_user_session_path
      end
    end


    def edit
      authorize @order
    end

    def update
      authorize @order
      @order.update!(order_params)
           redirect_to orders_path
    end

    def destroy
      authorize @order
    end

    def confirm
      authorize @order
      code =  (params[:confirm]["code"]).to_i
      if @order.promotion.digits_code == code
        @order.status = "Picked-up"
        @order.save!
        flash[:notice] = t('flash.coupon-ok')
        redirect_to order_path(@order.id)
      else
        flash[:alert] = t('flash.coupon-fail')
        redirect_to order_path(@order.id)
      end

      def booked
          @order = Order.find(params[:id])
          @order.status = "Booked"
          @order.save!
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
