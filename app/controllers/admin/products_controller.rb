module Admin
  class ProductsController < BaseController
    before_action :product, only: [:update, :destroy, :show]

    def index
      products = Product.all
      render json: products
    end

    def create
      product = Product.new product_params[:product]
      product.variants.build product_params[:variant]
      product.save!

      render json: product, status: :created
    end

    def update
      product.assign_attributes product_params[:product]
      # variant = product.variants.find(product_params[:variant][:variant_id])
      variant = product.variants.first
      variant.assign_attributes product_params[:variant]

      variant.save!
      product.save!

      render json: product
    end

    def show
      render json: product
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
      params.permit(product: [:brand_id,
                              :category_id,
                              :name,
                              :description,
                              :available_on],
                    variant: [:price, :cost, :variant_id, :image])
    end
  end
end
