# frozen_string_literal: true

# This is the ProductFilter class
class ProductFilter
  def self.call(products, params)
    params.each do |param|
      if Attribute.all.map(&:name_eng).include?(param[0])
        products &= Product.joins(:attributes_products).merge(AttributesProduct.where(value: param[1].values))
      end
    end
    products &= Product.where('price >= ?', params['price_from']) if params['price_from'].present?
    products &= Product.where('price <= ?', params['price_to']) if params['price_to'].present?
    if params[:search].present?
      products &= Product.where('name LIKE ? OR description LIKE ?', "%#{params[:search]}%",
                                "%#{params[:search]}%")
    end
    case params[:select]
    when 'price_desc'
      products = products.sort_by(&:get_current_price).reverse
    when 'price_acs'
      products = products.sort_by(&:get_current_price)
    when 'rating_desc'
      products = products.sort_by(&:get_rating).reverse
    end
    Kaminari.paginate_array(products).page(params[:page]).per(16)
  end
end
