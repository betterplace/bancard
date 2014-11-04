module Bancard
  class SingleBuyInit
    include Bancard::Utils

    attr_accessor :given_params, :public_key, :private_key

    def initialize(given_params = {})
      @given_params = stringify_keys(given_params)
      @public_key   = @given_params.delete('public_key')
      @private_key  = @given_params.delete('private_key')
    end

    def response
      # Implement me
    end

    def request_params
      {
        operation:  operation_params,
        public_key: public_key,
      }
    end

    def operation_params
      {
        amount:          formatted_amount,
        cancel_url:      given_params['cancel_url'],
        currency:        currency,
        description:     given_params['description'],
        return_url:      given_params['return_url'],
        shop_process_id: shop_process_id,
        token:           token,
      }
    end

    private

    def currency
      given_params['currency'] || Bancard::DEFAULT_CURRENCY
    end

    def formatted_amount
      sprintf('%.2f', amount)
    end

    def amount
      given_params['amount_in_cents'].to_i / 100.0
    end

    def shop_process_id
      given_params['shop_process_id']
    end

    def token
      Digest::MD5.hexdigest [private_key, shop_process_id, formatted_amount, currency].join('')
    end
  end
end
