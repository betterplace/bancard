require 'spec_helper'

describe Bancard::SingleBuyRollback do
  let(:rollback) { Bancard::SingleBuyRollback.new(shop_process_id: 123, public_key: 'public') }

  describe '#operation_params' do
    let(:params) { rollback.operation_params }

    it 'includes the correct shop_process_id' do
      expect(params[:shop_process_id]).to eq 123
    end

    it 'includes the md5ed token' do
      expect(params[:token]).to eq '5f048967e46b9de52a4656793c66b802'
    end
  end

  describe '#request_params' do
    let(:params) { rollback.request_params }

    it 'includes the correct public_key' do
      expect(params[:public_key]).to eq 'public'
    end

    it 'includes the operation_params' do
      expect(params[:operation]).to eq rollback.operation_params
    end
  end
end
