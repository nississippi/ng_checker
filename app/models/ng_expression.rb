class NgExpression < ApplicationRecord
  belongs_to :ng_genre

  validates :ng_expression, presence: true
end
