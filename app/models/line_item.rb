class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.sold_price
    end
  end

  def total_price
    unit_price * quantity
  end

  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def cart_present
    if cart.nil?
      errors.add(:cart, "is not a valid order.")
    end
  end




end
