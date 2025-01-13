class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.integer :inventory_count

      t.timestamps
    end
  end
end
