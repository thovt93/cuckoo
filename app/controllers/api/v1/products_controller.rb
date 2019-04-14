class Api::V1::ProductsController < Api::V1::BaseController
  def index
    product = Product.all
    render json: ProductSerializer.new(product).serialized_json
  end
end
