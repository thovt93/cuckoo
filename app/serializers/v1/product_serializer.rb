class V1::ProductSerializer < V1::ApplicationSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description
  has_many :variants
end
