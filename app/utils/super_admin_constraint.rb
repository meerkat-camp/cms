class SuperAdminConstraint
  def matches?(request)
    return false unless request.session[:user_id]

    User.exists?(id: request.session[:user_id], super_admin: true)
  end
end
