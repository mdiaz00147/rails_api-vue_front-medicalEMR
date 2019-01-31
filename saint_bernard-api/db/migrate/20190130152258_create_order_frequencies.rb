class CreateOrderFrequencies < ActiveRecord::Migration[5.1]
  def change
    create_table :order_frequencies do |t|
      t.string :uuid
      t.string :value
      t.integer :unit
      t.timestamps
    end
  end
end
