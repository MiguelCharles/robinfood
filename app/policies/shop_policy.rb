class ShopPolicy < ApplicationPolicy

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit? # Only the user who owns the shop is authorized
    user.admin? || user.id == record.user_id
  end

  def update? # Only the user who owns the shop is authorized
    user.admin? || user.id == record.user_id
  end

  def destroy?
    user.admin?
  end

  def promotions? # Only the user who owns the shop is authorized
    user.admin? || user.id == record.user_id
  end

end
