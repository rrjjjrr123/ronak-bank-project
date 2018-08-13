class ChargesController < ApplicationController

  def create
    # Amount in cents   
    # Stripe.api_key = "sk_test_2F9x6t1nueCU97ck5tSxJDel"
    @order = Order.find(params[:order_id])
    @user = User.find(params[:user_id])

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      customer: customer.id,
      amount: customer.amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    redirect_to  user_order_path(@user, @order)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
