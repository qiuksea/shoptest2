class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :basic_price, precision: 8, scale: 2
      t.decimal :sold_price, precision: 8, scale: 2
      t.integer :creator_id
      t.integer :updater_id
      t.timestamps null: false
    end
  end
end
