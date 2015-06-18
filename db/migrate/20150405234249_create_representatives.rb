class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :nombre_rep
      t.string :apellido_rep
      t.integer :edad
      t.string :parentesco
      t.text :dir_rep
      t.string :tel_1
      t.string :tel_2

      t.timestamps null: false
    end
  end
end
