class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.string :uuid
      t.text :description
      t.datetime :moment
      t.integer  :admission_id
      t.index :admission_id
      t.timestamps
    end
  end
end
