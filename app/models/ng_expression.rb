class NgExpression < ApplicationRecord
  belongs_to :ng_genre
  has_many :ng_tagging_contents, dependent: :destroy

  validates :ng_expression, presence: true
  enum vote: { yes: 0, difficult: 1, no: 2 }
end
