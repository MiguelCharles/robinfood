class PromotionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      #scope.where(user: user)
    end
  end

  def create?
    return true
    # tout user peut créer un shop ( si validation par admin), et un shop peut créer une promotion
  end

  def new?
    if user.shops.empty?

      return false
    else
      true
    end
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
