class V1::ProductSerializer < V1::ApplicationSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :images

  attributes :images do |product|
    return unless product.images.attachments
    product.images.map do |image|
      ActiveStorage::Current.set(host: 'localhost:3000') do
        image.variant(combine_options: { gravity: 'center',
                                         thumbnail: '844x572>',
                                         extent: '844x572>',
                                         background: 'white'
                                       }).processed.service_url
      end
    end
  end
end
