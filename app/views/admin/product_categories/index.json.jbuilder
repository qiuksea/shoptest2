json.array!(@admin_product_categories) do |admin_product_category|
  json.extract! admin_product_category, :id
  json.url admin_product_category_url(admin_product_category, format: :json)
end
