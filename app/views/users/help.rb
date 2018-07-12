<div><h1>Welcome to the Banking system </h1></div><br>
  <div class="container">
    <div class="row">
      <div class="col-sm-6"> 
        Account no.<%= current_user.bank_account.account_number %>
      </div>
      <div class="col-sm-6">
       Balance:<%= current_user.bank_account.balance %>
      </div>
    </div><br><br>
  
    <div class="row">
      <div class="col-sm-4">
        <%=link_to "Click here for Amount tranfer",amount_transfer_user_bank_accounts_path(current_user) %>
      </div>
      <div class="col-sm-4">
        <%=link_to "Add Beneficiary Account",new_beneficiary_path %>
      </div>

       <div class="col-sm-4">
        <%=link_to "Veiw Transaction Details",user_bank_accounts_path(current_user) %>
      </div>  
    </div> 
  </div>


----------------------------------------------------------------------------

  approval before login by admin
    def active_for_authentication? 
    super && approved?   
  end 
  
  def inactive_message 
    if !approved? 
      :not_approved   
    else 
      super # Use whatever other message 
    end 
  end

  _______________________________________________________________________


  <div class="container">
  <table class="table table-condensed">
    <thead>
      <tr>
        <th>SellerName</th>
        <th>Items</th>
        <th></th>
      </tr>
    </thead>
    <tbody> 
        <tr>
          <td><%= @seller.full_name %></td>
            <td><% @seller.items.each do|item|%>
              <td><%=item.title%></td>
            </td>    
        </tr>

      <% end %>
    </tbody>
  </table>
</div> 