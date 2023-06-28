class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_onsele: true).page(params[:page])
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

end
