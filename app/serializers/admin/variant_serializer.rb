class Admin::VariantSerializer < Admin::ApplicationSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :sku, :cost, :price, :position, :image_url

  def image_url
    if object.image.attached?
      ActiveStorage::Current.set(host: 'localhost:3000') do
        object.image.variant(combine_options: { gravity: 'center',
                                                thumbnail: '50x50>',
                                                extent: '50x50>',
                                                background: 'white'
                                              }).processed.service_url
      end
    end
  end
end
