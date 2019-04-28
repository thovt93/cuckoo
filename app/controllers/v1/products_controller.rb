module V1
  class ProductsController < BaseController
    def index
      product = Product.all
      render json: ProductSerializer.new(product).serialized_json
    end
  end
end
