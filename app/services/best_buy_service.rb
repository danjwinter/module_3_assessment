require 'open-uri'

class BestBuyService
  attr_reader :connection, :user

  def initialize(user)
    @connection ||= Faraday.new(url: "http://api.bestbuy.com/v1/") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end
    @user = user

    add_token_to_headers
  end

  def products(product_id)
    parse(connection.get("products/#{product_id}.json", apiKey: ENV['BEST_BUY_KEY']))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def add_token_to_headers
    connection.headers = {Authorization: "token #{ENV['BEST_BUY_KEY']}"}
  end
end
