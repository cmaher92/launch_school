require 'minitest/autorun'
require_relative 'transaction'
require_relative 'cash_register'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(25)
    @transaction.amount_paid = 40
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(@transaction.amount_paid, current_amount - previous_amount)
  end

  def test_change
    assert_equal 15, @register.change(@transaction)
  end

  def test_give_receipt
    assert_output("You've paid $25.\n") { @register.give_receipt(@transaction) }
  end
end
