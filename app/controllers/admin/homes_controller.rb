class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
  end

 protected
 
  def order_params
    params.require(:order).permit(:status, :payment_method)
  end
end
