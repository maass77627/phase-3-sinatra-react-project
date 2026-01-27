class AddCookTimeToRecipes < ActiveRecord::Migration[6.1]
  def change
     add_column :recipes, :cook_time, :integer
  end
end
