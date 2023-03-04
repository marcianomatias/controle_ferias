class CreatePeriodoFeria < ActiveRecord::Migration[7.0]
  def change
    create_table :periodo_feria do |t|
      t.date :data_inicio
      t.date :data_fim
      t.references :colaborador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
