class Public::OrdersController < ApplicationController
  def new
     @order = Order.new
  end

  def confilm
    select_address = 0
    case select_address
    when 0 then
    @order = Order.new(order_params)

    when 1 then
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

    when 2 then
    @order = Order.new(order_params)
    @address = Shipping_address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    end
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
