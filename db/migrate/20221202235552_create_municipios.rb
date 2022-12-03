class CreateMunicipios < ActiveRecord::Migration[7.0]
  def change
    create_table :municipios do |t|
      t.string :nome, null: false, limit: 100
      t.references :estado, null: false, foreign_key: { table_name: :estados }
      t.string :codigo_ibge, null: true, limit: 10, index: { unique: true }
      t.timestamps
    end

    add_index :municipios, [:nome, :estado_id], unique: true
  end
end
