class SitePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      return scope.all if @user.super_admin?

      scope.joins(:site_users).where(site_users: { user: })
    end
  end

  def index?
    user.present?
  end
end
