# works like ActiveMerchant::Billing::Response to maintain compatibility to
# active merchant gateways

module Bancard
  class SingleBuyInitResponse
    attr_reader :params

    def initialize(response)
      @original_response = response
      @params = JSON.parse(response.body)
    end

    def success?
      params['status'] == 'success'
    end

    def process_id
      params['process_id']
    end

    def message
    end
  end
end
