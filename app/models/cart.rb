class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id, quantity_val)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += quantity_val
    else
      current_item = line_items.build(product_id: product_id)
      current_item.quantity = quantity_val
    end
    current_item
  end

end
