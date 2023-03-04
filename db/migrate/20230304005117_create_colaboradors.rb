class CreateColaboradors < ActiveRecord::Migration[7.0]
  def change
    create_table :colaboradors do |t|
      t.string :nome
      t.string :cargo
      t.date :data_contratacao

      t.timestamps
    end
  end
end
