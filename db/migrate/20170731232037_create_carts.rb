class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string :address1
      t.string :address2
      t.string :zip
      t.string :name

      t.integer :buildid
      t.integer :userid

      t.timestamps
    end
  end
end
