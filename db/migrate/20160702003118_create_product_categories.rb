class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string  :name
      t.integer :creator_id
      t.integer :updater_id
      t.timestamps null: false
    end
  end
end
