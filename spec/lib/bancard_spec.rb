require 'spec_helper'

describe Bancard do
  describe '.test?' do
    it 'returns false if nothing was set' do
      Bancard.test = nil
      expect(Bancard).not_to be_test
    end

    it 'returns true if set to true' do
      Bancard.test = true
      expect(Bancard).to be_test
    end

    it 'returns false if set to false' do
      Bancard.test = false
      expect(Bancard).not_to be_test
    end
  end

  describe '.vpos_url' do
    it 'returns the correct vpos_url for test' do
      expect(Bancard.vpos_url).to eq 'https://vpos.infonet.com.py:8888'
    end

    it 'returns the correct vpos_url for live' do
      Bancard.test = false
      expect(Bancard.vpos_url).to eq 'https://vpos.infonet.com.py'
    end

    it 'appends a given path' do
      expect(Bancard.vpos_url('/foo/bar')).to eq 'https://vpos.infonet.com.py:8888/foo/bar'
    end
  end

end
