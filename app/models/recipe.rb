class Recipe < ActiveRecord::Base

  # t.string :title, null: false
  # # t.text :summary, null: false
  # t.string :image
  # t.string :ingredients
  # t.string :url
  # t.string :source
  # t.string :source_icon

  # t.timestamps null: false

  has_many :favorites
  has_many :users, through: :favorites

  def ingredients_list
    # @ingredients ||= ingredients[2..-3].split('", "')
    # @ingredients ||= YAML.load(ingredients)
    YAML.load(ingredients)
  end


end
