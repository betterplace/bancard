# works like ActiveMerchant::Billing::Response to maintain compatibility to
# active merchant gateways

module Bancard
  class SingleBuyInitResponse
    attr_reader :body
    REDIRECT_PATH = '/payment/single_buy'

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
      Bancard.vpos_url(REDIRECT_PATH) + "?process_id=#{process_id}"
    end

    def process_id
      body['process_id']
    end

    def message
    end
  end
end
