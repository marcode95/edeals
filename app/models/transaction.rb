class Transaction < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
<<<<<<< HEAD
  validates :amount, presence: true
=======
>>>>>>> cf14afac38958bbf592fc42ec288d295b8c08d7c
  belongs_to :user
  has_and_belongs_to_many :groups
end
