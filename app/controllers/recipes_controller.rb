# RECIPES CONTROLLER ######################################

# SHOW
get '/recipes/:recipe_id' do
  @recipe = Recipe.find_by(id: params[:recipe_id])

  if @recipe
    erb :'recipes/show'
  else
    redirect '/'
  end
end
