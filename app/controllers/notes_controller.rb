# NOTES CONTROLLER #############################

post '/notes' do
  favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:recipe_id] )

  note = Note.new(
    favorite_id: favorite.id,
    text: params[:note]
    )

  if note.save
    redirect back
  else
    @errors = note.errors.full_messages

    erb :'recipe/show'
  end
end
