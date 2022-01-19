# frozen_string_literal: true

class CommandProcessor
  ADD = 'Add'
  CHARGE = 'Charge'
  CREDIT = 'Credit'
  attr_reader :line, :command

  def initialize(line)
    @line = line
  end

  def call
    splited_line = line.split(' ')
    @command = splited_line.first

    case command
    when ADD
      params = add_data(splited_line)
      AddCardService.new(**params).call
    when CHARGE
      params = charge_data(splited_line)
      ChargeService.new(**params).call
    when CREDIT
      params = credit_data(splited_line)
      CreditService.new(**params).call
    end
  end

  private

  def add_data(splited_line)
    {
      holder_name: splited_line[1],
      card_number: splited_line[2],
      limit: amount_to_number(splited_line[3])
    }
  end

  def charge_data(splited_line)
    {
      holder_name: splited_line[1],
      charge_amount: amount_to_number(splited_line[2])
    }
  end

  def credit_data(splited_line)
    {
      holder_name: splited_line[1],
      credit_amount: amount_to_number(splited_line[2])
    }
  end

  def amount_to_number(amount)
    amount.delete('^0-9').to_i
  end
end
