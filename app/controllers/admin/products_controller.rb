module Admin
  class ProductsController < BaseController
    before_action :product, only: [:update, :destroy, :show]

    def index
      products = Product.all
      render json: ProductSerializer.new(products).serialized_json
    end

    def create
      product = Product.create! product_params
      render json: ProductSerializer.new(product).serialized_json, status: :created
    end

    def update
      product.update_attributes! product_params
      render json: ProductSerializer.new(product).serialized_json
    end

    def show
      render json: ProductSerializer.new(product).serialized_json
    end

    def destroy
      product.destroy!
      render status: :no_content
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
