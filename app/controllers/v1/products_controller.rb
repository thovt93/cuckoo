module V1
  class ProductsController < BaseController
    before_action :product, only: [:update, :destroy, :show]

    def index
      product = Product.all
      render json: ProductsSerializer.new(product).serialized_json
    end

    def show
      render json: ProductSerializer.new(product).serialized_json
    end

    private

    def product
      Product.find params[:id]
    end

    def product_params
      params.permit(:brand_id,
                    :category_id,
                    :name,
                    :description,
                    :available_on,
                    images: [])
    end
  end
end
