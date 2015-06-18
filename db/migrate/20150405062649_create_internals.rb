class CreateInternals < ActiveRecord::Migration
  def change
    create_table :internals do |t|
      t.string :nombre
      t.string :apellido
      t.string :sexo
      t.string :f_nacimiento
      t.integer :edad
      t.text :dir
      t.string :tel
      t.string :nacionalidad
      t.string :estado_civil
      t.string :escolaridad
      t.string :ocupacion
      t.string :ingreso_prev
      t.string :referencia
      t.string :tipo_ingreso
      t.text :motivo
      t.text :stado

      t.timestamps null: false
    end
  end
end
