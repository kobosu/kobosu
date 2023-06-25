class Admin::OrderItemsController < ApplicationController
  
  def update
    @order_items = CartItem.create(cart_items_params)
  end
  
  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
