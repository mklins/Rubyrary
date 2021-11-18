# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def create?
    user.guest?
  end

  def update?
    record == user || user.admin_role?
  end

  def index?
    user.admin_role?
  end

  def show?
    record == user || user.admin_role?
  end

  def destroy?
    user.admin_role?
  end
end
