# SESSIONS CONTROLLER #############################################

# NEW
get '/users/login' do
  @user = User.new
  erb :'/users/login'
end

# CREATE
post '/users/login' do
  @user = User.find_by(email: params[:user][:email]) if params[:user]
  if @user && @user.authenticate(params[:user][:password])
    session[:email] = @user.email
    redirect to "/users/#{@user.id}"
  else
    @error = "E-mail or password invalid"
    status 401
    @user = User.new(email: params[:user][:email])
    erb :'/users/login'
  end
end

# DESTROY
get '/logout' do
  session[:email] = nil
  redirect '/'
end
