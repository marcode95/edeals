module TransactionsHelper
  def total_transaction_sum
    sum = 0
    @owntransactions.each do |transaction|
      sum += transaction.amount
    end
    sum
  end

  def total_external_transaction_sum
    sum = 0
    @owntransactions.each do |transaction|
      if transaction.groups.empty?
        sum += transaction.amount
      end
    end
    sum
  end

  def eurofy(amount)
    amount.to_s.insert(-3, ',').insert(-1, '€')
  end
end
