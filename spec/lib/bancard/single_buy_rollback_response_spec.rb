require 'spec_helper'

describe Bancard::SingleBuyRollbackResponse do
  let(:body) { { 'status' => 'success', 'process_id' => '123' } }
  let(:typhoeus_response) { Typhoeus::Response.new(body: body.to_json) }
  let(:response) { Bancard::SingleBuyRollbackResponse.new(typhoeus_response) }

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
    it 'equals the response body, but parsed' do
      expect(response.params).to eq body
    end
  end

  describe '#message' do
    it 'returns nil' do
      expect(response.message).to be_nil
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
