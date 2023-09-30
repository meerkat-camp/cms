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

  def show?
    super_admin? || site_user?
  end

  def create?
    signed_in?
  end

  def update?
    super_admin? || site_user?
  end

  private

  def site_user?
    scope.exists?(id: record.id)
  end
end
