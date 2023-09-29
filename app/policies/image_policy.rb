class ImagePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      return scope.all if @user.super_admin?

      scope.joins(site: :site_users).where(site_users: { user: })
    end
  end

  def show?
    super_admin? || image_within_scope?
  end

  private

  def image_within_scope?
    scope.exists?(id: record.id)
  end
end
