class Product
  attr_reader :customer_review_average,
              :sku,
              :name,
              :short_description,
              :image,
              :sale_price

  def initialize(result)
    @customer_review_average = result[:customerReviewAverage] || "not given"
    @sku = result[:sku] || "not given"
    @name = result[:name] || "not given"
    @short_description = result[:shortDescription] || "not given"
    @image = result[:image] || "not given"
    @sale_price = result[:salePrice] || "not given"
  end
end
