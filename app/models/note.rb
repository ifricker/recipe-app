class Note < ActiveRecord::Base
  # Remember to create a migration!
  # t.integer :favorite_id, null: false
  # t.text :text, null: false

  belongs_to :favorite
  has_one :user, through: :favorite
  has_one :recipe, through: :favorite

end
