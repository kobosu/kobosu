class Public::CartItemsController < ApplicationController
  def index
   @cart_items = CartItem.all
   @total = 0
  end

  def update
  end

  def destroy
  end

  def destroy_all
    Cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(params_cart_item)
    @cart_items=current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id==@cart_item.item_id
          new_quantity = cart_item.quantity + @cart_item.quantity
          cart_item.update_attribute(:quantity, new_quantity)
          @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path,notice:"カートに商品が入りました"
  end


  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
  end

end
