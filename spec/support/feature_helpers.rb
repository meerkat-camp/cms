module FeatureHelpers
  def as_user
    user = create(:user)
    login_as(user)
    yield(user)
  end

  def as_superadmin
    user = create(:user, :superadmin)
    login_as(user)
    yield(user)
  end

  def login_as(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end
