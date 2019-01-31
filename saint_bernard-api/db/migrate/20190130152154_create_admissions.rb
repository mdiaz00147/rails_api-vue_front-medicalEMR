class CreateAdmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :admissions do |t|
      t.string :uuid
      t.datetime :moment
      t.timestamps
    end
  end
end
