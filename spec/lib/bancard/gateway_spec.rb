require 'spec_helper'

describe Bancard::Gateway do
  let(:gateway) { Bancard::Gateway.new(public_key: 'public', shop_process_id: 123) }

  describe '#initialize' do
    it 'requires a public_key' do
      expect { Bancard::Gateway.new(shop_process_id: 123) }.to raise_error ArgumentError
    end

    it 'saves the public key' do
      expect(gateway.public_key).to eq 'public'
    end

    it 'requires a shop_process_id' do
      expect { Bancard::Gateway.new(public_key: 'public') }.to raise_error ArgumentError
    end

    it 'saves the public key' do
      expect(gateway.shop_process_id).to eq 123
    end
  end

  describe '#init_single_buy' do
    it 'builds a SingleBuyInit and returns its response' do
      pending
    end
  end
end

