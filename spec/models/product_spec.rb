require "rails_helper"

RSpec.describe Product do
  before { @product = Product.new(sample_product_result)}
  it "should only respond to desired traits" do
    expect(@product).to respond_to :name
    expect(@product).to respond_to :sku
    expect(@product).to respond_to :customer_review_average
    expect(@product).to respond_to :short_description
    expect(@product).to respond_to :sale_price
    expect(@product).to respond_to :image

    expect(@product).to_not respond_to :regular_price
    expect(@product).to_not respond_to :source
    expect(@product).to_not respond_to :type

    expect(@product.name).to eq "Sennheiser - Camera-Mount Wireless Microphone System - Black"
    expect(@product.sku).to eq 9678429
    expect(@product.customer_review_average).to eq "not given"
    expect(@product.short_description).to eq sample_product_result[:shortDescription]
    expect(@product.sale_price).to eq 629.95
    expect(@product.image).to eq "http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_sa.jpg"
  end

end
