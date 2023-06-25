class Public::OrdersController < ApplicationController
  def new
     @order = Order.new
  end

  def confilm
    @order = Order.new(order_params)
    
    case select_address
    
    when 0 then
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

    when 1 then
    @order = Order.new(order_params)
    @address = Shipping_address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    
    
    when 2 then
    @shipping_address = ShippingAddress.new
    @shipping_address.postal_code = params[:order][:postcode]
    @shipping_address.address = params[:order][:address]
    @shipping_address.name = params[:order][:name]
    
    @shipping_address.save
    
    @order.postal_code = @shipping_address.postal_code
    @order.address = @shipping_address.address
    @order.name = @shipping_address.name
      
    end
    
    @cart_items = current_costomer.cart_items
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private
def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)

end


end
