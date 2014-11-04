require "bancard/gateway"
require "bancard/version"

module Bancard
  def self.test=(value)
    @test = !!value
  end

  def self.test?
    !!@test
  end
end
