class Public::OrdersController < ApplicationController
  def new
     @order = Order.new

  end

  def confilm
    @order = Order.new(order_params)

    case select_address
    when 0 then
    @order = Order.new(order_params)
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

    when 1 then
    @order = Order.new(order_params)
    @address = Shipping_address.find(params[:order][:address_id])
    @order.postcode = @address.postcode
    @order.address = @address.address
    @order.name = @address.name


    when 2 then
    @shipping_address = ShippingAddress.new
    @shipping_address.postcode = params[:order][:postcode]
    @shipping_address.address = params[:order][:address]
    @shipping_address.name = params[:order][:name]

    @shipping_address.save

    @order.postcode = @shipping_address.postcode
    @order.address = @shipping_address.address
    @order.name = @shipping_address.name

    end

    @cart_items = current_costomer.cart_items.all
    # @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @cart_items.subtotal.each do |num|
    @all_order_price =+ num
    end
    @postage = 800
    @total_price = @all_order_price + @postage

  end

  def create
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    @order.billing_amount = params[:order][:billing_amount]
    @order.postcode = params[:order][:postcode]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :billing_amount, :postcode, :address, :name, :postage)
  end

end
