class ItemsController < ApplicationController

  def new
    @item = Item.new
    # @genres = Genre.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def index
    @items = Item.all
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
    #リンク先確認・修正
  end

  def item_params
    params.require(:item).permit(:name, :tax_out_price, :explanation, :profile_image)
  end

end
