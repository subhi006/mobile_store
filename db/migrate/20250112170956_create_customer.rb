class CreateCustomer < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :number
      t.string :password
      t.string :mail
      t.timestamps
    end
  end
end
