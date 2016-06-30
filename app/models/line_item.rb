class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :cart_present
  #validate :has_enough_products

  before_save :finalize

  # def has_enough_products # in stock > required quantity
  #   if product.product_stock < quantity
  #     errors.add_to_base("Product sold out.")
  #   end
  # end

  def unit_price
    if persisted?
      self[:unit_price]   #in case price is changed  during process
    else
      product.sold_price.present? ? product.sold_price : product.basic_price #condition ? if_true : if_false
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

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end

end
