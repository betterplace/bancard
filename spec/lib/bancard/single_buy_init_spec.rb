require 'spec_helper'

describe Bancard::SingleBuyInit do
  let(:init) do
    Bancard::SingleBuyInit.new(
      amount_in_cents: 200,
      cancel_url:      'http://cancel.url',
      description:     'Description',
      public_key:      'public',
      return_url:      'http://return.url',
      shop_process_id: 123,
    )
  end

  describe '#operation_params' do
    let(:params) { init.operation_params }

    it 'includes the correct formated amount' do
      expect(params[:amount]).to eq '2.00'
    end

    it 'includes the correct currency' do
      expect(params[:currency]).to eq 'PYG'
    end

    it 'includes the correct shop_process_id' do
      expect(params[:shop_process_id]).to eq 123
    end

    it 'includes the correct description' do
      expect(params[:description]).to eq 'Description'
    end

    it 'includes the correct return_url' do
      expect(params[:return_url]).to eq 'http://return.url'
    end

    it 'includes the correct cancel_url' do
      expect(params[:cancel_url]).to eq 'http://cancel.url'
    end

    it 'includes the md5ed token' do
      expect(params[:token]).to eq '8ef35d70cd5ef62c81f5bc31019e871a'
    end
  end

  describe '#request_params' do
    let(:params) { init.request_params }

    it 'includes the correct public_key' do
      expect(params[:public_key]).to eq 'public'
    end

    it 'includes the operation_params' do
      expect(params[:operation]).to eq init.operation_params
    end
  end
end
