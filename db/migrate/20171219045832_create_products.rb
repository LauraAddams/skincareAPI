class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.string :ingredients

      t.timestamps
    end
  end
end
