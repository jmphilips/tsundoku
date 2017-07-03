class RenameIsbn13InBooksToIsbn13 < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :isbn13, :isbn_13
  end
end
