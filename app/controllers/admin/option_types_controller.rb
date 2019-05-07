module Admin
  class OptionTypesController < BaseController
    def index
      render json: OptionType.all
    end
  end
end
