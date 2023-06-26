class Public::ShippingAddressesController < ApplicationController
  def index
    @new = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
     if @shipping_address.customer == current_customer
     render :edit   
     else
     redirect_to shipping_addresses_path
     end
  end

  def create
     @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if@shipping_address.save
      flash[:notice] = "You have created shipping_addresses successfully."
      redirect_to shipping_addresses_path
    else
      render :index
    end
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id]) 
    if@shipping_address.update(shipping_address_params)
     flash[:notice] = "You have updated shipping_address successfully."
     redirect_to shipping_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id]) 
    @shipping_address.destroy
    redirect_to shipping_addresses_path
  end

protected

 def shipping_address_params
    params.require(:shipping_address).permit(:name, :address, :postcode)
 end
end