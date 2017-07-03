class RenameIsbnInBooksToIsnb10 < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :isbn, :isbn_10
  end
end
