# frozen_string_literal: true

# This is the ProductsController class
class ProductsController < ApplicationController
  before_action :set_product

  def index
    if params[:search].present?
      @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @products = Product.all
    end
    @categories = []
    @products.each do |product|
      product.categories.each do |category|
        @categories.push(category) unless @categories.include?(category)
      end
    end
  end

  def show
    @breadcrumbs = @product.categories.first.ancestors
    @products = []
    while @products.length<5
      temp = Product.all.sample
      @products << temp unless @products.include?(temp)
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
