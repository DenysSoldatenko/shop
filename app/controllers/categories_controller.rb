class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @children = @category.descendants
    @attributes = CategoryAttributeValues.call(@category, params)
    @products = ProductFilter.call(@category.get_all_children_products, params)
    @breadcrumbs = @category.ancestors
    @prices = [params["price_from"], params["price_to"]]
    @selected = params[:select]
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end
