module Bancard
  class Gateway
    attr_accessor :public_key, :shop_process_id
    TEST_URL = 'https://vpos.infonet.com.py:8888'
    LIVE_URL = 'https://vpos.infonet.com.py'

    def initialize(public_key: nil, shop_process_id: nil)
      @public_key      = public_key      or raise ArgumentError, "public_key is required"
      @shop_process_id = shop_process_id or raise ArgumentError, "shop_process_id is required, got"
    end

    def vpos_url
      Bancard.test? ? TEST_URL : LIVE_URL
    end
  end
end
