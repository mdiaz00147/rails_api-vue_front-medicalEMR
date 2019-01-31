class CreateMedicationOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :medication_orders do |t|
      t.string :uuid
      t.string :name
      t.integer :unit
      t.decimal :dosage
      t.integer :route
      t.integer :frequency_id
      t.text :necessity
      t.index :frequency_id
      t.integer :patient_id
      t.index :patient_id
      t.timestamps
    end
  end
end
