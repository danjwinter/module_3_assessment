class ItemSearchesController < ApplicationController

  def new_search

  end

  def search_results
    binding.pry
    @products = BestBuyService.new.products(params[:search][:search_field])
  end
end
