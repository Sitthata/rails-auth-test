class AddUserRefAndContentToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_column :comments, :content, :text
  end
end
