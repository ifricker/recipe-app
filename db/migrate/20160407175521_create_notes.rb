class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :favorite_id, null: false
      t.text :text, null: false

      t.timestamps null: false
    end
  end
end
