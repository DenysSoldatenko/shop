class ProductFilter
  def self.call(products, params)
    params.each do |param|
      if Attribute.all.map(&:name_eng).include?(param[0])
        products = products & Product.joins(:attributes_products).merge(AttributesProduct.where(value: param[1].values))
      end
    end
    if params["price_from"].present?
      products = products & Product.where("price >= ?", params["price_from"])
    end
    if params["price_to"].present?
      products = products & Product.where("price <= ?", params["price_to"])
    end
    if params[:search].present?
      products = products & Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
    case params[:select]
    when "price_desc"
      products = products.sort_by{|product| product.price}.reverse
    when "price_acs"
      products = products.sort_by{|product| product.price}
    when "rating_desc"
      products = products.sort_by{|product| product.get_rating}.reverse
    end
    return products
  end
end