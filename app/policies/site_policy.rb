class SitePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      return scope.all if @user.super_admin?

      scope.joins(:site_users).where(site_users: { user: })
    end
  end

  def index?
    signed_in?
  end

  def create?
    signed_in?
  end

  def show?
    super_admin? || scope.exists?(id: record.id)
  end
end
