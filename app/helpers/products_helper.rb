module ProductsHelper
  def price_product(product)
    sale = 1 - product.sale / 100.0
    product.price * sale
  end
end
