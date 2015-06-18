class CreateConsents < ActiveRecord::Migration
  def change
    create_table :consents do |t|
      t.integer :cuota
      t.text :acuerdo
      t.integer :duracion
      t.text :medicamentos
      t.string :encargado

      t.timestamps null: false
    end
  end
end
