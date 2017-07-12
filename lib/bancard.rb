require 'digest/md5'
require 'typhoeus'
require 'json'
require 'uri'
require 'bancard/version'
require 'bancard/utils'
require 'bancard/single_buy_init'
require 'bancard/single_buy_init_response'
require 'bancard/single_buy_rollback'
require 'bancard/single_buy_rollback_response'
require 'bancard/single_buy_confirmation'
require 'bancard/single_buy_confirmation_response'
require 'bancard/gateway'

module Bancard
  TEST_URL = 'https://vpos.infonet.com.py:8888'
  LIVE_URL = 'https://vpos.infonet.com.py'

  DEFAULT_CURRENCY = 'PYG'

  def self.sandbox!
    @sandbox = true
  end

  def self.sandbox?
    !!@sandbox
  end

  def self.vpos_url(path = nil)
    uri      = URI.parse(sandbox? ? TEST_URL : LIVE_URL)
    uri.path = path.to_s
    uri.to_s
  end
end
