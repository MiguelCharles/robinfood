class UserPolicy < ApplicationPolicy

# Can only see or modify your own profile
  def show?
    user.admin? || record.id == user.id
  end

  def edit?
    user.admin? || record.id == user.id
  end

  def update?
    user.admin? || record.id == user.id
  end

end
