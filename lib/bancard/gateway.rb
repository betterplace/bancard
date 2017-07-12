module Bancard
  class Gateway
    attr_accessor :public_key, :private_key

    def initialize(auth_params = {})
      @public_key      = auth_params.fetch(:public_key)
      @private_key     = auth_params.fetch(:private_key)
    end

    def single_buy(params = {})
      init = build_single_buy_init(params)
      submit_single_buy_init(init)
    end

    def rollback(params = {})
      rollback = build_single_buy_rollback(params)
      submit_single_buy_rollback(rollback)
    end

    def single_buy_confirmation(params = {})
      confirmation = build_single_buy_confirmation(params)
      submit_single_buy_confirmation(confirmation)
    end
    
    private

    def build_single_buy_init(params = {})
      Bancard::SingleBuyInit.new(merge_auth_params(params))
    end

    def build_single_buy_rollback(params = {})
      Bancard::SingleBuyRollback.new(merge_auth_params(params))
    end
    
    def build_single_buy_confirmation(params = {})
      Bancard::SingleBuyConfirmation.new(merge_auth_params(params))
    end
    
    def submit_single_buy_init(init)
      url      = Bancard.vpos_url(Bancard::SingleBuyInit::ENDPOINT)
      response = Typhoeus.post(url, body: init.request_params.to_json)
      Bancard::SingleBuyInitResponse.new response
    end

    def submit_single_buy_rollback(rollback)
      url      = Bancard.vpos_url(Bancard::SingleBuyRollback::ENDPOINT)
      response = Typhoeus.post(url, body: rollback.request_params.to_json)
      Bancard::SingleBuyRollbackResponse.new response
    end

    def submit_single_buy_confirmation(confirmation)
      url      = Bancard.vpos_url(Bancard::SingleBuyConfirmation::ENDPOINT)
      response = Typhoeus.post(url, body: confirmation.request_params.to_json)
      Bancard::SingleBuyConfirmationResponse.new response
    end
    
    def merge_auth_params(hash)
      hash.merge(public_key: public_key, private_key: private_key)
    end
  end
end
