module TransactionsHelper
  def total_transaction_sum(transactionlist)
    sum = 0
    (transactionlist).each do |transaction|
      sum += transaction.amount
    end
    sum
  end
end
