class Api::Admin::BrandsController < Api::Admin::BaseController
  before_action :brand, only: [:update, :destroy, :show]

  def index
    brands = Brand.all
    render json: BrandSerializer.new(brands).serialized_json
  end
  
  def create
    brand = Brand.create! brand_params
    render json: BrandSerializer.new(brand).serialized_json, status: :created
  end

  def update
    brand.update_attributes! brand_params
    render json: BrandSerializer.new(brand).serialized_json
  end

  def destroy
    brand.destroy!
    render status: :no_content
  end

  private

  def brand
    Brand.find params[:id]
  end

  def brand_params
    params.permit(:name)
  end
end
