class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
     create_table :recipes do |t|
      t.string  :name
      t.date    :last_cooked_on
      t.string :image
      t.integer :category_id
      t.timestamps
    end
  end
end
