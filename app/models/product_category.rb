class ProductCategory < ActiveRecord::Base
  has_many :products
  validates :name, presence: true
  default_scope {order('name, updated_at desc')}
end
