class CreateDoctors < ActiveRecord::Migration[7.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :age
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
