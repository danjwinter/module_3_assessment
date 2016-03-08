class Api::V1::ItemsController < Api::V1::ApiController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    @item = Item.find(params[:id])
    respond_with @item
  end

  def destroy
    respond_with Item.find(params[:id]).destroy
  end

  def create
    respond_with Item.create(item_params)
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
