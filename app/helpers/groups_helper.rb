module GroupsHelper
  def group_transaction_sum
    sum = 0
    @group.deals.each do |deal|
      sum += deal.amount
    end
    eurofy(sum)
  end

  def group_transaction_count
    @group.deals.count
  end
end
