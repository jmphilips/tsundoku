class AddStateToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :state, :string, default: 'listed'
  end
end
