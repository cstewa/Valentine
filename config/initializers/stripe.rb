Rails.configuration.stripe = {
  :publishable_key => 'pk_test_lbh53srcNz2Al8g2O3shIQvL',
  :secret_key      => 'sk_test_4EJDj7KSURZFAzOdlXWQYkJk'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]