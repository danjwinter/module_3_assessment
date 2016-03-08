class ItemSearchesController < ApplicationController

  def new_search

  end

  def search_results
    BestBuyService.new.products("sennheiser")
  end
end
