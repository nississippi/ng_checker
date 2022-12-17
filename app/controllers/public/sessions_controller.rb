# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  # 退会しているかを判断するメソッド
  def configure_sign_in_params
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @customer.valid_password?(params[:customer][:password])
        ## 【処理内容3】
        if @customer.is_deleted == true
          redirect_to new_customer_registration_path
        end
      end
  end
end
