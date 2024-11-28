class NavigationItemPolicy < ApplicationPolicy
  %i[destroy? move_up? move_down?].each do |action|
    define_method(action) do
      super_admin? || site_user?(record.site)
    end
  end
end
