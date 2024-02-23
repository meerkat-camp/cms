class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

  private

  def signed_in?
    user.present?
  end

  def super_admin?
    user&.super_admin?
  end

  def scope
    Pundit::PolicyFinder.new(record.class).scope.new(user, record.class).resolve
  end

  def site_user?(site)
    SitePolicy::Scope.new(@user, Site).resolve.exists?(id: site.id)
  end
end
