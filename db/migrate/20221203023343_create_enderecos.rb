class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :complemento
      t.references :municipio, null: false, foreign_key: { table_name: :municipios }
      t.references :municipe, null: false, foreign_key: { table_name: :municipes }, index: { unique: true }

      t.timestamps
    end
  end
end
