class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_normal_customer, only: [:edit, :update]

  def show
    @customer = current_customer
    @bookmarks = @customer.bookmarks
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_mypage_path(@customer)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :is_deleted)
  end

  def ensure_normal_customer
    if current_customer.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーのプロフィールは更新できません。'
    end
  end
end
