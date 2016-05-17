# USERS CONTROLLER ###########################################

# NEW
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

# CREATE
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:email] = @user.email
    redirect to "/users/#{@user.id}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

# SHOW
get "/users/:id" do
  if current_user && current_user.id == params[:id].to_i
    @user = User.find(current_user.id)
    erb :'/users/profile'
  else
    redirect to '/logout'
  end
end
