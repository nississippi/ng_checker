class NgAnswer < ApplicationRecord
  belongs_to :ng_expression
  belongs_to :customer
  
  enum vote: { yes: 0, difficult: 1, no: 2 }
end
