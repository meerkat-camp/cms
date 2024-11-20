class SitePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      @resolve ||= fetch_sites
    end

    private

    def fetch_sites
      return Site.none unless @user
      return scope.all if @user.super_admin?

      scope.joins(:site_users).where(site_users: { user: })
    end
  end

  def index?
    signed_in?
  end

  def show?
    super_admin? || site_user?(record)
  end

  def create?
    signed_in?
  end

  def update?
    super_admin? || site_user?(record)
  end

  def create_social_media_link?
    super_admin? || site_user?(record)
  end
end
