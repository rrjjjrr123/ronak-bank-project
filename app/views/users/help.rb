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

_______________________________________________________________________
class RegistrationsController < Devise::RegistrationsController

  prepend_before_action :require_no_authentication, only: [:new]  
  skip_before_action :require_no_authentication, only: [:new,:create]

  protected     
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)    
  end

  def after_sign_in_path_for(resource)
  end

  def after_sign_up_path_for(resource)   
    orders_path
  end

  def after_inactive_sign_up_path_for(resource)
  end
end


_______________________________________________________________________


  private 

  def get_transaction
    transaction = Transaction.find(params[:transaction])
  end

  def get_order
    @order = Order.find(params[:order_id])
  end



# it "assigns given comment to correct article"
  #   create!
  #   expect(assigns(:comment).article_id).to eq params[:article_id]
  # end



  #     it "creates a new item" do
  #       item = FactoryGirl.attributes_for(:item)
  #       expect{
  #       post :create, params: { item: item } 
  #     }.to change(Item,:count).by(1)
  #   end
  # end
  # end




  # context "with invalid attributes" do
  #   it "does not save the new contact" do
  #     expect{
  #       post :create, contact: Factory.attributes_for(:invalid_contact)
  #     }.to_not change(Contact,:count)
  #   end
    
  #   it "re-renders the new method" do
  #     post :create, contact: Factory.attributes_for(:invalid_contact)
  #     response.should render_template :new
  #   end
  # end


      # it "redirects to the new contact" do
    #   post :create, params: params
    #   response.should redirect_to root_path
    # end




      sequence :random_title do |n|
    (0..2).map { (65 + rand(26)).chr }.join
  end

  sequence :random_description do |n|
    (0..5).map { (65 + rand(26)).chr }.join
  end

  sequence(:ranking) do |n|
    @random_rankings ||= (300..10000).to_a.shuffle
    @random_rankings[n]
  end
  
  sequence(:seller_ranking) do |n|
    @random_rankings ||= (1..10000).to_a.shuffle
    @random_rankings[n]
  end

  factory :item do 
    title     { FactoryGirl.generate(:random_title)  }
    description  { FactoryGirl.generate(:random_description)  }
    price { FactoryGirl.generate(:ranking) }
    seller_id { FactoryGirl.generate(:seller_ranking) }
  end