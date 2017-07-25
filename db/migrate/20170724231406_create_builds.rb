class CreateBuilds < ActiveRecord::Migration[5.1]
  def change
    create_table :builds do |t|
      t.string :name
      t.string :description
      t.integer :motherboard
      t.integer :ram
      t.integer :cpu
      t.integer :gpu
      t.integer :psu
      t.integer :chasis
      t.integer :userid

      t.timestamps
    end
  end
end
