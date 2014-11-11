# works like ActiveMerchant::Billing::Response to maintain compatibility to
# active merchant gateways

module Bancard
  class SingleBuyInitResponse
    attr_reader :body

    def initialize(response)
      @original_response = response
      @body              = JSON.parse(response.body)
    end

    def success?
      body['status'] == 'success'
    end

    def params
      body.merge 'payment_url' => payment_url
    end

    def payment_url
      @original_response.headers['Location']
    end

    def process_id
      params['process_id']
    end

    def message
    end
  end
end
