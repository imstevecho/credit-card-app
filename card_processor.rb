# frozen_string_literal: true

# For repated testing purpose
# we can start with clean stage
CardTransaction.destroy_all
CreditCard.destroy_all

case ARGV.length
when 0
  data = $stdin.read
when 1
  data = File.read(ARGV[0])
else
  puts 'Wrong argument is given'
  puts 'e.g) rails runner card_processor.rb < PATH_TO_INPUT_FILE'
  exit 1
end

line_splited_content = data.split("\n")
CardProcessorService.new(data: line_splited_content).call

CardTransactionReport.new.generate_report
