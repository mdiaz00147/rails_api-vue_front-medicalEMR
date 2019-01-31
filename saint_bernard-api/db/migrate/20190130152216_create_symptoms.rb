class CreateSymptoms < ActiveRecord::Migration[5.1]
  def change
    create_table :symptoms do |t|
      t.string :uuid
      t.text :description
      t.integer :admission_id
      t.timestamps
    end
  end
end
