class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @children = @category.descendants
    @products = []
    @children.each do |category|
      category.products.each do |product|
        @products.push(product) unless @products.include?(product)
      end
    end
    @category.products.each do |product|
      @products.push(product) unless @products.include?(product)
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end
