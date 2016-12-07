class SessionsController < Devise::SessionsController
  after_create :add_orders_to_user

  def add_orders_to_user
    if current_user
      orders = Order.where(id: session[:order_ids])
      if orders.present?
        current_user << orders
      end
    end
  end
end
