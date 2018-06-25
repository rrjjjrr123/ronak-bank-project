class BankAccount < ApplicationRecord
  belongs_to :user
  validates :account_number , presence: true , uniqueness: true
  validates :balance , presence: true , numericality: true ,on: :update

  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(description, amount)
    add_transaction(description, amount)
  end

  def debit(description, amount)
    add_transaction(description, -amount)
  end

  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount)
  end 
end