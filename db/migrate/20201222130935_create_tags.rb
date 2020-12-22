class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      enable_extension('citext') #Nao diferenciar maiusculo de minusculo

      t.citext :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tags, [:name, :user_id] , unique: true #tags unicas por usuario
  end
end
