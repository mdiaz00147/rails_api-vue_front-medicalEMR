class CreateAllergies < ActiveRecord::Migration[5.1]
  def change
    create_table :allergies do |t|
      t.string :uuid
      t.text :description
      t.integer :patient_id
      t.index :patient_id
      t.timestamps
    end
  end
end
