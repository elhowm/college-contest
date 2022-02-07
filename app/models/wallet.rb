class Wallet
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def top_up(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
