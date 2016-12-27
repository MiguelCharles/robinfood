class PagesController < ApplicationController
  def index
    if current_user
      redirect_to promotions_path
    end
  end

  def about

  end
end
