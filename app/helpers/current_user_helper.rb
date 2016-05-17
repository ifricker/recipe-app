helpers do
  def current_user
    @current_user ||= User.find_by(email: session[:email])
  end
end
