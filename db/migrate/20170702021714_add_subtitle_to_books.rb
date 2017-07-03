class AddSubtitleToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :subtitle, :string
    add_column :books, :thumbnail, :string
    add_column :books, :small_thumbnail, :string
    add_column :books, :text_snippet, :string
    add_column :books, :isbn13, :string
  end
end
