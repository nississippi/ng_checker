class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  #@customer = Customer.find(params[:id])を何度も書かなくていいよう下記を定義
  before_action :ensure_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all
  end

  def show
    @comments = @customer.comments
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :is_deleted)
  end

  def ensure_customer
    @customer = Customer.find(params[:id])
  end
end
