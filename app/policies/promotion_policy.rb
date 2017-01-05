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

  end

  def show
    true
  end

  def update?
    #seul un user qui a crée un shop qui lui meme a crée une promotion peut créer une promotion pour ce shop
    user_as_promotion_owner_or_admin?
  end

  def destroy?
    user_as_promotion_owner_or_admin?
  end


  def user_as_promotion_owner_or_admin?
   user.admin? || record.shop.user == user
  end

end
