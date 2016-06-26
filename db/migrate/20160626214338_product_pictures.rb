class ProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|
      t.integer :product_id
      t.attachment :image
      t.integer :creator_id
      t.integer :updater_id
      t.timestamps null: false
    end
  end
end
