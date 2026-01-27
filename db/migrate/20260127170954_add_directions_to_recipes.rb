class AddDirectionsToRecipes < ActiveRecord::Migration[6.1]
  def change
     add_column :recipes, :directions, :string
  end
end
