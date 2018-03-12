class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :hodl

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

    if !@sender.valid? && @sender.balance <= @amount
      "Transaction rejected. Please check your account balance."


    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @hodl = @amount
      @amount = 0
      @status = 'complete'

    end
  end

    def reverse_transfer
      if @status == 'complete'
        @sender.balance += @hodl
        @receiver.balance -= @hodl
        @status = 'reversed'
      end
    end


end
