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
      sum += transaction.amount if transaction.groups.empty?
    end
    sum
  end

  def eurofy(amount)
    if amount < 10
      amount.to_s.insert(0, '0,0').insert(-1, '€')
    elsif amount < 100
      amount.to_s.insert(0, '0,').insert(-1, '€')
    else
      amount.to_s.insert(-3, ',').insert(-1, '€')
    end
  end

  def no_groups?(trans)
    if trans.groups.empty?
      render partial: 'single-transactions', locals: {transaction: trans}
    end
  end

  def trans_img_attached?(trans)
    if trans.groups.first and trans.groups.first.image.attached?
      render partial: 'single-image', locals: {transaction: trans}
    else
      render partial: 'groups/no-image'
    end
  end
end
