class CreateValuations < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
      t.integer :id_internal
      t.string :nombre
      t.text :padecimiento
      t.text :sintoma
      t.text :trat_prev
      t.integer :TA
      t.integer :FC
      t.integer :FR
      t.integer :TEMP
      t.integer :peso
      t.integer :talla
      t.text :ex_aus
      t.text :exa_ment
      t.text :diagnostico
      t.text :pronostico
      t.text :trat_sug
      t.string :medico

      t.timestamps null: false
    end
  end
end
