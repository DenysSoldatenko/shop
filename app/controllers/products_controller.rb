# frozen_string_literal: true

# This is the ProductsController class
class ProductsController < ApplicationController
  before_action :set_product, except: :index

  def index
    @products = ProductFilter.call(Product.all, params)
    @categories = []
    @products.each do |product|
      @categories = @categories | product.categories
    end
    @prices = [params["price_from"], params["price_to"]]
    @search = params[:search]
    @selected = params[:select]
  end

  def show
    @breadcrumbs = @product.categories.first.ancestors
    @products = Product.all.shuffle.first(5)
    @attributes = {}
    Attribute.all.each do |attribute|
      @attributes[attribute.name] = AttributesProduct.find_by(attribute_id: attribute.id, product_id: @product.id).value unless AttributesProduct.find_by(attribute_id: attribute.id, product_id: @product.id).value == nil
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
