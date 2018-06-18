class BankAccountsController < ApplicationController
  
  def index
    @bank_accounts = BankAccout.all 
  end

  def new 

  end

  def create 
  end 

  
  def update 
  end    
end
