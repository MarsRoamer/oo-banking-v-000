class Transfer
require 'pry'
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    # @sender.balance >= @amount && @sender.status == 'open' && @receiver.status == 'open'
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

    if !@sender.BankAccount.valid?
      "Transaction rejected. Please check your account balance."

    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @amount = 0
      @status = 'complete'

    end



  end


end
