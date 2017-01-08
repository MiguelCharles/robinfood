class PagesController < ApplicationController
  def index
    if current_user # if user is connected
      redirect_to promotions_path
    end
  end

  def about

  end
end
