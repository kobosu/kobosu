class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end
  
  def order_history
    @orders = CustomerId.Order.page(params[:page])
    @order = Order.find(params[:id])
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id]) 
    if@order.update(order_params)
     flash[:notice] = "You have updated order successfully."
     redirect_to admin_order_path(@order.id)  
    else
     redirect_to admin_order_path(@order.id)
    end
  end

 protected
 
def order_params
    params.require(:order).permit(:status, :payment_method)
end

end
