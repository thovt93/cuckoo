class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.string :sku
      t.references :product, foreign_key: true
      t.string :name
      t.float :cost, precision: 6, scale: 2, default: 0
      t.float :price, precision: 6, scale: 2, default: 0
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
