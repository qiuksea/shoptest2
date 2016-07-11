class ProductCategory < ActiveRecord::Base
  has_many :products
  validates :name, presence: true
  #default_scope {order('name, updated_at desc')}# avoid default_scope http://blog.plataformatec.com.br/2013/02/active-record-scopes-vs-class-methods/

  scope :recent, -> {order('name, updated_at desc')}
end
