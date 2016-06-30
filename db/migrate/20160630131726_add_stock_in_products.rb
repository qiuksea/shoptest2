class AddStockInProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_stock, :integer, null: false, default: 0
  end
end
