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

  describe '#vpos_url' do
    it 'returns the correct vpos_url for test' do
      expect(gateway.vpos_url).to eq 'https://vpos.infonet.com.py:8888'
    end

    it 'returns the correct vpos_url for live' do
      Bancard.test = false
      expect(gateway.vpos_url).to eq 'https://vpos.infonet.com.py'
    end
  end
end

