class SocialMediaLinkPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      return scope.all if @user.super_admin?

      scope.joins(site: :site_users).where(site_users: { user: })
    end
  end

  def destroy?
    super_admin? || part_of_allowed_site?
  end

  private

  def part_of_allowed_site?
    scope.exists?(id: record.id)
  end
end
