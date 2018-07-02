class BankAccountPdf < Prawn::Document

  def initialize(transactions)
    super()
    @transactions = Transaction.order("id Desc").all
    transaction_id    
  end 
  
  def transaction_id
    data = [["Credit Account","Debit Account Number","Amount"]] 
    data += @transactions.map do |transaction|
        [transaction.debit_bank_account.account_number,transaction.credit_bank_account.account_number,transaction.amount]
    end
    table data
  end      
end  