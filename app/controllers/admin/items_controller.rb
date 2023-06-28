class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item.id)
    else
    redirect_to request.referer
    end
  end

  def index
    @items = Item.page(params[:page])
    @genres = Genre.all

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def item_params
    params.require(:item).permit(:name, :tax_out_price, :explanation, :profile_image, :genre_id, :is_onsele)
  end

end