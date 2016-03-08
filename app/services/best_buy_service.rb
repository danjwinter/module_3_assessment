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
    binding.pry
    parse(connection.get("products(longDescription=#{search_term}*)", pageSize: 15, apiKey: ENV['BEST_BUY_KEY'],format: "json"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def add_token_to_headers
    connection.headers = {Authorization: "token #{ENV['BEST_BUY_KEY']}"}
  end
end
