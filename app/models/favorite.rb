class Favorite < ActiveRecord::Base

# t.integer :user_id
# t.integer :recipe_id

# t.timestamps null: false

  belongs_to :user
  belongs_to :recipe
  has_many :notes

end
