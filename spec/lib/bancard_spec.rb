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
end
