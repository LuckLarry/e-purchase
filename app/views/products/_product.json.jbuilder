json.extract! product, :id, :category, :status, :name, :number, :unit, :price, :start_volume, :volume, :brand, :spec, :mark, :image, :created_at, :updated_at
json.url product_url(product, format: :json)