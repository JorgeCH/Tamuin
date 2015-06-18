class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :id_internal
      t.string :nombre
      t.integer :num_pago
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
