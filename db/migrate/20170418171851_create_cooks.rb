class CreateCooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cooks do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :neighborhood
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
