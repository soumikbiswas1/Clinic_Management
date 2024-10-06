class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: { to_table: :users }  # Changed doctor to reference users table
      t.datetime :date

      t.timestamps
    end
  end
end
