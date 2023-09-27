class SuperAdminConstraint
  def matches?(request)
    return false unless request.session[:user_id]

    user = User.find_by(id: request.session[:user_id])
    user&.super_admin?
  end
end
