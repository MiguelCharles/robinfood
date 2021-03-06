class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def show?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user_id == user.id
  end

  def confirm?
    record.user_id == user.id
  end

  def edit?
    record.user_id == user.id
  end

  def update?
    record.user_id == user.id
  end

end
