# INDEX CONTROLLER #######################################

# INDEX
get '/' do
  @recipes = Recipe.all.order(created_at: :desc).limit(12)

  erb :index
end
