class BankAccount

  def initialize(name)
    @user = name
    @account_number = generate_account_number
    @transactions = []
    add_transaction("Initial balance",0.00)  
  end  

  def debit(description, amount)
    add_transaction(description, -amount)
  end
  
  def credit(description, amount) 
    add_transaction(description, amount)
  end

  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount )
  end   

  def transaction_details
    @transactions
  end  

  def delete_account
    remove_instance_variable(:@account_number)    
  end

  def balance
    balance = 0.00
    @transactions.each do|transaction|
      balance += transaction[:amount]
    end  
    p balance
  end  

  def generate_account_number
    rand(10**10)
  end  
end  

bankaccount = BankAccount.new("ronak")
bankaccount.credit("dsff",500)
bankaccount.balance
