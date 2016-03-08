require 'open-uri'

class BestBuyService
  attr_reader :connection

  def initialize
    @connection ||= Faraday.new(url: "http://api.bestbuy.com/v1/") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end

  end

  def products(search_term)
    results = parse(connection.get("products(longDescription=#{search_term}*)", pageSize: 15, apiKey: ENV['BEST_BUY_KEY'],format: "json"))
    results[:products].map do |result|
      Product.new(result)
    end
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
