class Product
  attr_reader :customer_review_average,
              :sku,
              :name,
              :short_description,
              :image,
              :sale_price

  def initialize(result)
    @customer_review_average = result[:customerReviewAverage]
    @sku = result[:sku]
    @name = result[:name]
    @short_description = result[:shortDescription]
    @image = result[:image]
    @sale_price = result[:salePrice]
  end
end
