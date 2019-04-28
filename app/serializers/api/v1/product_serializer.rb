class Api::V1::ProductSerializer < Api::V1::ApplicationSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :images

  attributes :images do |product|
    return unless product.images.attachments
    product.images.map do |image|
      ActiveStorage::Current.set(host: 'localhost:3000') do
        image.variant(resize: '50x50!',
                      gravity: 'center',
                      background: 'white').processed.service_url
      end
    end
  end
end
