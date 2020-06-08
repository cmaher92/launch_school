class Account
  def initialize(balance, pin)
    @balance = balance
    @pin = pin
  end
  
  def check_balance(entered_pin)
    if self.pin == entered_pin
      puts self.balance
    else
      puts "incorrect pin!"
    end
  end

  protected
  attr_reader :pin, :balance
end 

account = Account.new(300, 1234)
account.check_balance(1234)
