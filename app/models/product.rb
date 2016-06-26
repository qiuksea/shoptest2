class Product < ActiveRecord::Base
  default_scope { where(active: true).order('updated_at desc, title')}#deleted/inactive products aren't shown.
  has_many :product_pictures, :dependent => :destroy
  accepts_nested_attributes_for :product_pictures,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['image'].blank? } # it points to picture model attrs
end
