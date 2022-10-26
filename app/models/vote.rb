class Vote < ApplicationRecord
  belongs_to :customer
  belongs_to :ng_expression
  enum vote: { yes: 0, difficult: 1, no: 2 }
end
