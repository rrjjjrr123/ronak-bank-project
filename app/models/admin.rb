class Admin < ApplicationRecord
  include DeviseInvitable::Inviter  
end
