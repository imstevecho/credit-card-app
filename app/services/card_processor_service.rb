# frozen_string_literal: true

class CardProcessorService
  attr_reader :data

  def initialize(data:)
    @data = data
  end

  def call
    ActiveRecord::Base.transaction do
      data.each { |line| CommandProcessor.new(line).call }
    end
  end
end
