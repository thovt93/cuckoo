module Admin
  class VariantsController < BaseController
    def create
      variant = product.variants.build variant_params.except(:option_value_id)
      variant.save!

      option_value = OptionValue.find params[:option_value_id]
      OptionValuesVariant.create!(variant: variant, option_value: option_value)
      render json: variant
    end

    def show
      variants = product.variants
      variant = variants.find params[:id]

      render json: variant
    end

    def destroy
      variants = product.variants
      variant = variants.find params[:id]
      variant.destroy! if variants.size > 1

      render status: :no_content
    end

    private

    def product
      Product.find params[:product_id]
    end

    def variant_params
      params.permit(:name, :sku, :price, :cost, :option_value_id,
                    :variant_id, :image)
    end
  end
end
