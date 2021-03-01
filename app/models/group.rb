class Group < ApplicationRecord
  validates :name, :presence => true, :length => { :minimum => 3 }
  belongs_to :user
  #has_and_belongs_to_many :transactions
  has_and_belongs_to_many :deals, foreign_key: "group_id", class_name: "Transaction"
end
