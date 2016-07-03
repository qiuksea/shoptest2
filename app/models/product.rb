class Product < ActiveRecord::Base
  default_scope { where(active: true).order('title, updated_at desc')}#deleted/inactive products aren't shown.
  has_many :product_pictures, :dependent => :destroy
  accepts_nested_attributes_for :product_pictures,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['image'].blank? } # it points to picture model attrs

  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :product_category

  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, presence: true
  validates :basic_price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :sold_price, :allow_nil => true, numericality: {greater_than_or_equal_to: 0.01}
  validates :product_stock, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def has_enough_products(quantity) # stock has enough required quantity for line-item?
    if product_stock == 0
      return 0 # sold out
    elsif product_stock >= quantity
      return 1 #enough
    elsif product_stock < quantity
      return -1 #not enough
    end
  end


  private
   # ensure that there are no line items referencing this product
   def ensure_not_referenced_by_any_line_item
     if line_items.empty?
         return true
         else
             errors.add(:base, 'Line Items present')
             return false
             end
   end

end
