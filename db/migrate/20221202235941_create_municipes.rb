class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :nome_completo
      t.string :cpf, null: false, limit: 14, index: { unique: true }
      t.string :cns, null: false
      t.string :email, null: false, limit: 100, index: { unique: true }
      t.date :data_nascimento, null: false
      t.string :telefone, null: false, limit: 20
      t.string :foto, null: false
      t.integer :status, null: false, default: 0
      t.references :municipio, null: false, foreign_key: { table_name: :municipios }

      t.timestamps
    end
  end
end
