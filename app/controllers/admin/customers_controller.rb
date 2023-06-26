class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id]) 
    if @customer.update(customer_params)
     flash[:notice] = "You have updated customer successfully."
     redirect_to admin_customer_path(@customer.id)  
    else
      render :edit
    end
  end


protected
 
 def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :telephone_number, :email, :is_active)
 end
end