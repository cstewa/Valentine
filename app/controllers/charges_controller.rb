class ChargesController < ApplicationController
  def new
  end

  def create
    user = user.find(params[:user_id])

    customer = Stripe::Customer.create(
      :email => user.email,
      :card  => params[:stripeToken],
      :plan => "paid"
    )

    user.stripe_id = customer.stripe_id
    user.save

    binding.pry

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
end
