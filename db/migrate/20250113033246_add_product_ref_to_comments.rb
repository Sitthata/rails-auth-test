class AddProductRefToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :product, null: false, foreign_key: true
  end
end
