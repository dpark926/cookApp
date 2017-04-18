class AddColumnUrl  < ActiveRecord::Migration[5.0]
  def change
    add_column :cooks , :image_url , :string
  end
end
