class ItemSearchesController < ApplicationController

  def new_search

  end

  def search_results
    @products = BestBuyService.new.products(params[:search][:search_field])
  end
end
