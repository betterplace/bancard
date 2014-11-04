module Bancard
  class Gateway
    attr_accessor :public_key, :shop_process_id

    def initialize(public_key: nil, shop_process_id: nil)
      @public_key      = public_key      or raise ArgumentError, "public_key is required"
      @shop_process_id = shop_process_id or raise ArgumentError, "shop_process_id is required, got"
    end

    def init_single_buy(params = {})
      # Bancard::SingleBuyInit.new(params).response
    end
  end
end
