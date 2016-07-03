class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product, product_id, quantity)
    current_item = line_items.find_by(product_id: product_id)
    product  = product

    if current_item # item exist
      added_quantity = current_item.quantity + quantity
      stock_status = product.has_enough_products(added_quantity)
      if stock_status == 1 #enough stock
        current_item.quantity += quantity
        current_item.save
        item_status  = 1
      elsif stock_status == 0   #sold out
        item_status  = 0
      elsif stock_status == -1 #stock < quantity
        item_status = -1
      end
    else #item not exist
      stock_status = product.has_enough_products(quantity)
      if stock_status == 1 #enough stock
        current_item = line_items.build(product_id: product_id)
        current_item.quantity = quantity
        current_item.save
        item_status = 1
      elsif stock_status == 0
        item_status  = 0
      elsif  stock_status == -1
        item_status = -1
      end
    end

  end

  def line_items_total
    line_items.collect { |item| item.valid? ?  item.total_price : 0 }.sum
    #line_items.to_a.sum { |item| item.total_price }
  end

end
