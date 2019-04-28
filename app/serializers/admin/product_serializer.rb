class Admin::ProductSerializer < Admin::ApplicationSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :images

  attributes :images do |product|
    return unless product.images.attachments
    product.images.map do |image|
      ActiveStorage::Current.set(host: 'localhost:3000') do
        image.variant(combine_options: { gravity: 'center',
                                         thumbnail: '50x50>',
                                         extent: '50x50>',
                                         background: 'white'
                                       }).processed.service_url
      end
    end
  end
end
