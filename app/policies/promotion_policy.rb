class PromotionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      #scope.where(user: user)
    end
  end

  def create?
    if user.shops.empty? # Only authorize user with shop to create promotion
      return false
    else
      true
    end
  end

  def new?
    if user.shops.empty? # Only authorize user with shop to create promotion
      return false
    else
      true
    end
  end

  def show
    true
  end

  def edit?
    #Only the owner
    user_as_promotion_owner_or_admin?
  end

  def update?
    #Only the owner
    user_as_promotion_owner_or_admin?
  end

  def destroy?
    user_as_promotion_owner_or_admin?
  end

  def changestatus? # Only the user who owns the shop owning the promo is authorized
    user.admin? || user.id == Shop.find(record.shop_id).user_id
  end

  def user_as_promotion_owner_or_admin?
   user.admin? || record.shop.user == user
  end

end
