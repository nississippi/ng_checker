class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :ng_expression

  validates :customer_id, uniqueness: { scope: :ng_expression_id }

end
