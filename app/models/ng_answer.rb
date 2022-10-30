class NgAnswer < ApplicationRecord
  belongs_to :ng_expression
  belongs_to :customer
  belongs_to :content

  enum vote: { yes: 0, no: 1, difficult: 2 }
end
