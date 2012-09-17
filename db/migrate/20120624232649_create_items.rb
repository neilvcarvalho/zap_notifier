class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :valor
      t.date :data_publicacao
      t.integer :id_zap

      t.timestamps
    end
  end
end
