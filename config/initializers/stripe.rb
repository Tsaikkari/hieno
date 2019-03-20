if Rails.env.production?
    Rails.configuration.stripe = {
      publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
      secret_key: ENV['STRIPE_SECRET_KEY']
    }
  else
    Rails.configuration.stripe = {
      publishable_key: 'pk_test_DJ6Bp6TmPA3WhjsDrJ9MIcE700x1okvxqn',
      secret_key: 'sk_test_bOUBd38I8WDMtjsIqoejof0p00jvlqSkzm'
    }
  end
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
