# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.guest?
  end

  def update?
    user.admin_role? || user.books_moderator_role? || user.groups_moderator_role?
  end

  def destroy?
    user.admin_role? || user.books_moderator_role?
  end

  def permitted_attributes_for_update
    if user.admin_role?
      [:title, :body, :cover, { group_ids: [] }]
    elsif user.books_moderator_role?
      %i[title body cover]
    elsif user.groups_moderator_role?
      [group_ids: []]
    end
  end
end
