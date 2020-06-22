# given the following classes, implement an instance method
# that compares the balance of two instances of BankAccount

class BankAccount
  attr_accessor :balance
  
  def initialize(balance)
    @balance = balance
  end

  def ==(other)
    balance == other.balance
  end
end

connors_account = BankAccount.new(3000)
skylars_account = BankAccount.new(3000)
p connors_account == skylars_account
