require 'spec_helper'

describe Bancard do
  describe '.sandbox?' do
    it 'returns false if nothing was set' do
      Bancard.instance_variable_set(:@sandbox, nil)
      expect(Bancard).not_to be_sandbox
    end

    it 'returns true if set to true' do
      Bancard.instance_variable_set(:@sandbox, true)
      expect(Bancard).to be_sandbox
    end

    it 'returns false if set to false' do
      Bancard.instance_variable_set(:@sandbox, false)
      expect(Bancard).not_to be_sandbox
    end
  end

  describe '.vpos_url' do
    it 'returns the correct vpos_url for sandbox' do
      expect(Bancard.vpos_url).to eq 'https://vpos.infonet.com.py:8888'
    end

    it 'returns the correct vpos_url for live' do
      Bancard.instance_variable_set(:@sandbox, false)
      expect(Bancard.vpos_url).to eq 'https://vpos.infonet.com.py'
    end

    it 'appends a given path' do
      expect(Bancard.vpos_url('/foo/bar')).to eq 'https://vpos.infonet.com.py:8888/foo/bar'
    end
  end

end
