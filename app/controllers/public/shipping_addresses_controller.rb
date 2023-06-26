class Public::ShippingAddressesController < ApplicationController
  def index
    @new = Shipping_addresse.new
    @shipping_addresses = Shipping_address.Customer.all
  end

  def edit
    @shipping_address = Shipping_address.find(params[:id])
     if @shipping_address.user == current_user
        render :edit
     else
     redirect_to shipping_addresses_path(shipping_address.customer.id)
     end
  end

  def create
     @shipping_address = Shipping_addresse.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if@shipping_address.save
      flash[:notice] = "You have created shipping_addresses successfully."
      redirect_to shipping_addresses_path(shipping_address.customer.id)
    else
      render :index
    end
  end

  def update
    @shipping_address = Shipping_address.find(params[:id]) 
    if@shipping_address.update(shipping_addresse_params)
     flash[:notice] = "You have updated shipping_address successfully."
     redirect_to shipping_addresses_path(shipping_address.customer.id)  
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = Shipping_address.find(params[:id]) 
    @shipping_address.destroy
    redirect_to shipping_address_path
  end


 def shipping_address_params
    params.require(:shipping_address).permit(:name, :address, :postcode)
 end
end