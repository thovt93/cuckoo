class Api::Admin::ProductsController < Api::Admin::BaseController
  def index
    product = Product.all
    render json: ProductSerializer.new(product).serialized_json
  end
end
