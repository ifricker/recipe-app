# FAVORITES CONTROLLER #########################################

# CREATE
post '/favorites' do
  redirect '/users/login' unless current_user

  @favorite = Favorite.new(
    user: current_user,
    recipe_id: params[:recipe_id]
    )

  if @favorite.save
    redirect "/users/#{current_user.id}"
  else
    status 500
    redirect back
  end
end

# DESTROY
delete '/favorites' do
  favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
  favorite.destroy

  if favorite.destroyed?
    redirect "/users/#{current_user.id}"
  else
    status 500
    redirect back
  end
end
