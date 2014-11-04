require 'simplecov'
require 'byebug'

SimpleCov.adapters.define 'gem' do
  add_filter '/spec/'
  add_filter '/autotest/'
  add_group 'Libraries', '/lib/'
end
SimpleCov.start 'gem'

require 'bancard'

RSpec.configure do |config|
  config.before do
    Bancard.test = true
  end
end
