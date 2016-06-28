class Product < ActiveRecord::Base
  default_scope { where(active: true).order('updated_at desc, title')}#deleted/inactive products aren't shown.
  has_many :product_pictures, :dependent => :destroy
  accepts_nested_attributes_for :product_pictures,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['image'].blank? } # it points to picture model attrs

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, presence: true
  validates :basic_price, presence: true

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
