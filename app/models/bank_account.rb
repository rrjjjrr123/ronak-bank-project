# this is bank class
class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true, on: :update
  accepts_nested_attributes_for :transactions, allow_destroy: true
end
