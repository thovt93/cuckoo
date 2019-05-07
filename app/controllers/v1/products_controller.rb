module V1
  class ProductsController < BaseController
    before_action :product, only: [:update, :destroy, :show]

    def index
      products = Product.all
      render json: products
    end

    def show
      render json: product
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
