class AddFieldsToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity, :integer, default: 0
    add_column :line_items, :unit_price, :decimal, precision: 8, scale: 2
    add_column :line_items, :total_price, :decimal, precision: 8, scale: 2
  end
end
