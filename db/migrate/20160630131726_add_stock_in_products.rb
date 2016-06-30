class AddStockInProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_stock, :integer
  end
end
