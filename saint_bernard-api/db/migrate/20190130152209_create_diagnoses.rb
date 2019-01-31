class CreateDiagnoses < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnoses do |t|
      t.string :uuid
      t.text :description
      t.string :code
      t.string :coding_system
      t.integer :admission_id
      t.integer :patient_id
      t.index :patient_id
      t.index :admission_id
      t.timestamps
    end
  end
end
