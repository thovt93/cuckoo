class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.string :description
      t.datetime :available_on

      t.timestamps
    end
  end
end
