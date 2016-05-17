# SEARCH CONTROLLER #############################################################

require 'json'
require 'open-uri'

# SEARCH
get '/search' do

  puts params

  user_query = URI::encode( params['q'] )
  @user_query = user_query
  @first = params["@first"]
  @last = params["@last"]

  url = "https://api.edamam.com/search?q=" + @user_query + "&from=" + @first + "&to=" + @last
  response = open(url).read
  my_hash = JSON.parse(response)
  @recipes = []

  my_hash['hits'].each do |hit|
    recipe = Recipe.find_or_initialize_by({url: hit['recipe']['url']})

    recipe.update_attributes({
      title:       hit['recipe']['label'],
      image:       hit['recipe']['image'],
      ingredients: hit['recipe']['ingredientLines'],
      source:      hit['recipe']['source'],
      # source_icon: hit['recipe']['sourceIcon']
      })
    @recipes << recipe
  end

  erb :'index'
end
