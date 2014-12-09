# works like ActiveMerchant::Billing::Response to maintain compatibility to
# active merchant gateways

module Bancard
  class SingleBuyRollbackResponse
    attr_reader :body

    def initialize(response)
      @original_response = response
      @body              = JSON.parse(response.body)
    end

    def success?
      body['status'] == 'success'
    end

    def params
      body
    end

    def process_id
      body['process_id']
    end

    def message
    end
  end
end
