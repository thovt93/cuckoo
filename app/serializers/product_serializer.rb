class ProductSerializer < ApplicationSerializer
  # include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :image

  # def image
    # rails_blob_path(object.images) if object.images.attached?
  # end

  attributes :image do |product|
    Rails.application.routes.url_helpers.rails_blob_path(product.image) if product.image.attached?
  end
end
