# this is admin class
class Admin < ApplicationRecord
  include DeviseInvitable::Inviter
end
