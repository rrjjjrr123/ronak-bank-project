Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
} 

Stripe.api_key = "sk_test_2F9x6t1nueCU97ck5tSxJDel" 

class RecordCharges
  def call(event)
    charge = event.data.object
    user = User.find_by(stripe_id: charge.customer)
    c = user.charges.where(stripe_id: charge.id).first_or_create
    c.update(
      amount: charge.amount,
      card_last4: charge.source.last4,
      card_type: charge.source.brand,
      card_exp_month: charge.source.exp_month,
      card_exp_year: charge.source.exp_year
    )
  end  
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
end