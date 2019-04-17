class Api::Admin::ProductsController < Api::Admin::BaseController
  def index
    product = Product.all
    render json: ProductSerializer.new(product).serialized_json
  end

  def create
    product = Product.create! product_params
    render json: ProductSerializer.new(product).serialized_json
  end

  private

  def product_params
    params.permit(:brand_id,
                  :category_id,
                  :name,
                  :description,
                  :available_on,
                  images: [])
  end
end
