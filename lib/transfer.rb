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
    i = 0
    while i < 1
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
      i += 1
    end

  end


end
