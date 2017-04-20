class CustomerAddImageUrl  < ActiveRecord::Migration[5.0]
  def change
    add_column :customers , :image_url , :string
  end
end
