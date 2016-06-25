class Product < ActiveRecord::Base
  default_scope { where(active: true) }#deleted/inactive products aren't shown.
end
