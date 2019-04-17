class ProductSerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :images

  attributes :images do |product|
    return unless product.images.attachments
    product.images.map do |image| 
      Rails.application.routes.url_helpers.rails_blob_path(image)
    end
  end
end
