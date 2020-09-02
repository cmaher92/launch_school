require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(20)
    # @transaction.amount_paid = 40
  end

  def test_prompt_for_payment
    input = StringIO.new("40\n")
    assert_output("You owe $20.\nHow much are you paying?\n") do
      @transaction.prompt_for_payment(input: input)
    end
    assert_equal 40, @transaction.amount_paid
  end
end
