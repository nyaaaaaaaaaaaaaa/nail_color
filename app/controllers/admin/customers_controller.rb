class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @items = @customer.items.page(params[:page])
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end
