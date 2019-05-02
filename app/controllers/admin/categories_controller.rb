module Admin
  class CategoriesController < BaseController
    before_action :category, only: [:update, :destroy, :show]

    def index
      categories = Category.all
      render json: categories
    end
    
    def create
      category = Category.create! category_params
      render json: category, status: :created
    end

    def update
      category.update_attributes! category_params
      render json: category
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
end
