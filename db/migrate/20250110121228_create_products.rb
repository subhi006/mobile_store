class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :company
      t.decimal :price
      t.string :version
      t.string :storage
      t.timestamps
    end
  end
end
