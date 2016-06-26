class Product < ActiveRecord::Base
  default_scope { where(active: true).order('updated_at desc, title')}#deleted/inactive products aren't shown.
end
