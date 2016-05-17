class AddRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      # t.text :summary, null: false
      t.string :image
      t.string :ingredients
      t.string :url
      t.string :source
      t.string :source_icon

      t.timestamps null: false
    end
  end
end
