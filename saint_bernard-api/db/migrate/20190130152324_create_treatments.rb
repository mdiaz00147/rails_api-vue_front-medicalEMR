class CreateTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :treatments do |t|
      t.string :uuid
      t.text :necessity
      t.text :description
      t.integer :patient_id
      t.index :patient_id
      t.timestamps
    end
  end
end
