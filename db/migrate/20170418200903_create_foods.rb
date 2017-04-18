class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :title
      t.string :cuisine
      t.integer :price
      t.string :description
      t.integer :cook_id
      t.string :url
      t.string :availability

      t.timestamps
    end
  end
end
