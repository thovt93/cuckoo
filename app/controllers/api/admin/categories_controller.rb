class Api::Admin::CategoriesController < ApplicationController
  before_action :category, only: [:update, :destroy, :show]

  def index
    categories = Category.all
    render json: CategorySerializer.new(categories).serialized_json
  end
  
  def create
    category = Category.create! category_params
    render json: CategorySerializer.new(category).serialized_json, status: :created
  end

  def update
    category.update_attributes! category_params
    render json: CategorySerializer.new(category).serialized_json
  end

  def destroy
    category.destroy!
    render status: :no_content
  end

  private

  def category
    Category.find params[:id]
  end

  def category_params
    params.permit(:name)
  end
end
