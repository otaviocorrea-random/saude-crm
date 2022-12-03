class CreateUfs < ActiveRecord::Migration[7.0]
  def change
    create_table :estados do |t|
      t.string :sigla, null: false, limit: 2, index: { unique: true }
      t.string :nome, null: false, limit: 100, index: { unique: true }

      t.timestamps
    end
  end
end
