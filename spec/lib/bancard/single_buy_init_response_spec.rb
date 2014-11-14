require 'spec_helper'

describe Bancard::SingleBuyInitResponse do
  let(:body) { { 'status' => 'success', 'process_id' => '123' } }
  let(:typhoeus_response) { Typhoeus::Response.new(body: body.to_json) }
  let(:response) { Bancard::SingleBuyInitResponse.new(typhoeus_response) }

  describe '#initialize' do
    it 'parses and stores the original response body' do
      expect(response.body).to eq body
    end
  end

  describe '#process_id' do
    it 'reads the process_id from the params' do
      expect(response.process_id).to eq '123'
    end
  end

  describe '#params' do
    it 'includes the process_id in the redirect' do
      expect(response.params['payment_url']).to include '123'
    end
  end

  describe '#success?' do
    it 'returns true on success' do
      expect(response).to be_success
    end

    it 'returns false on failure' do
      body['status'] = 'failure'
      expect(response).not_to be_success
    end
  end

end
