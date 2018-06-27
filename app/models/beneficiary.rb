class Beneficiary < ApplicationRecord
  belongs_to :user
  belongs_to :beneficiary, class_name: 'User'
end
