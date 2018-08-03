module Api
  module V1
    class UsersController < Api::BaseController
      before_action :authenticate_user!    

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name,
       :phone_no, :user_type)
      end  
    end  
  end  
end   