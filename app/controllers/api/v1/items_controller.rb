class Api::V1::ItemsController < Api::V1::ApiController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    @item = Item.find(params[:id])
    respond_with @item
  end
end
