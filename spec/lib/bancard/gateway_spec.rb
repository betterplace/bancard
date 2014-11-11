require 'spec_helper'

describe Bancard::Gateway do

  let(:auth_params) { { public_key: 'public', private_key: 'private' } }
  let(:gateway)     { Bancard::Gateway.new(auth_params) }

  describe '#initialize' do
    it 'requires a public_key' do
      expect { Bancard::Gateway.new(private_key: 'foo') }.to raise_error KeyError
    end

    it 'saves the public key' do
      expect(gateway.public_key).to eq 'public'
    end

    it 'requires a private_key' do
      expect { Bancard::Gateway.new(public_key: 'public') }.to raise_error KeyError
    end

    it 'saves the private_key' do
      expect(gateway.private_key).to eq 'private'
    end
  end

  describe '#single_buy' do
    it 'builds a SingleBuyInit and returns its response' do
      response = gateway.single_buy({})
      expect(response).to be_a Bancard::SingleBuyInitResponse
    end

    it 'includes the auth params' do
      init = gateway.__send__(:single_buy_init)
      expect(init.private_key).to eq 'private'
      expect(init.public_key).to eq 'public'
    end
  end
end
