class Shops::PromotionsController < ApplicationController
  # before_action :set_promotion, only: [:show, :edit, :update, :destroy]
  layout 'user'
  def index
    # @q = Promotion.search(params[:q])
    @promotions = Promotion.joins(:shop).where("shops.user_id = ?", current_user.id)
    end


end
