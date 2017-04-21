class ChangeCustomerAndCookImageDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:customers, :image_url, "")
    change_column_default(:cooks, :image_url, "")
  end
end
