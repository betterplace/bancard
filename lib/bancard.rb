require 'digest/md5'
require 'bancard/version'
require 'bancard/utils'
require 'bancard/gateway'
require 'bancard/single_buy_init'

module Bancard
  TEST_URL = 'https://vpos.infonet.com.py:8888'
  LIVE_URL = 'https://vpos.infonet.com.py'

  DEFAULT_CURRENCY = 'PYG'

  def self.test=(value)
    @test = !!value
  end

  def self.test?
    !!@test
  end

  def self.vpos_url
    test? ? TEST_URL : LIVE_URL
  end
end
