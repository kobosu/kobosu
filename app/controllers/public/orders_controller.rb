class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
     @order = Order.new

  end

  def confilm
    @order = Order.new(order_params)
    #binding.pry

    if params[:order][:select_address] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
      @address = ShippingAddress.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:select_address] == "2"
      @shipping_address = ShippingAddress.new
      @shipping_address.postcode = params[:order][:postcode]
      @shipping_address.address = params[:order][:address]
      @shipping_address.name = params[:order][:name]
      @order.postcode = @shipping_address.postcode
      @order.address = @shipping_address.address
      @order.name = @shipping_address.name

    else
      redirect_to new_order_path

    end

    @cart_items = current_customer.cart_items.all
    @all_order_price = 0
    @cart_items.each do |cart_item|
    @all_order_price += cart_item.subtotal
    end
    @postage = 800
    @total_price = @all_order_price + @postage

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.order_id = @order.id
      order_item.item_id = cart.item_id
      order_item.quantity = cart.quantity
      order_item.purchase_price = cart.item.with_tax_price
      order_item.save
    end

    redirect_to complete_path
    @cart_items.destroy_all

  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = order.find(params[:id])
    @orders = current_customer.order
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :billing_amount, :postcode, :address, :name, :postage)
  end

end
