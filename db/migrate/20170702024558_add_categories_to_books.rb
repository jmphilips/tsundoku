class AddCategoriesToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :categories, :string
  end
end
