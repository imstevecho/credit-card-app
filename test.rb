# frozen_string_literal: true

class Test
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def call
    m1
    puts balance
  end

  def m1
    @balance = 100
  end
end

test = Test.new
test.call
