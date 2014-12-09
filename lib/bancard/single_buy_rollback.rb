module Bancard
  class SingleBuyRollback
    include Bancard::Utils
    ENDPOINT = '/vpos/api/0.3/single_buy/rollback'

    attr_accessor :given_params, :public_key, :private_key

    def initialize(given_params = {})
      @given_params = stringify_keys(given_params)
      @public_key   = @given_params.delete('public_key')
      @private_key  = @given_params.delete('private_key')
    end

    def request_params
      {
        operation:  operation_params,
        public_key: public_key,
      }
    end

    def operation_params
      {
        shop_process_id: shop_process_id,
        token:           token,
      }
    end

    private

    def shop_process_id
      given_params['shop_process_id']
    end

    def token
      Digest::MD5.hexdigest [private_key, shop_process_id, 'rollback', '0.00'].join('')
    end
  end
end
