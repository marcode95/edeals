class Group < ApplicationRecord
  validates :name, :presence => true, :length => { :minimum => 3 }
  belongs_to :user
  #has_and_belongs_to_many :transactions
  has_and_belongs_to_many :deals, foreign_key: "group_id", class_name: "Transaction"
  has_one_attached :image

  def add_to_group(id)
    @group.deals << Transaction.where(id: id)
  end
end
