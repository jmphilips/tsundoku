class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :giver
      t.references :taker
      t.references :book
      t.timestamps
    end
  end
end
