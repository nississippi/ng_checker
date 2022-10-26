class NgExpression < ApplicationRecord
  belongs_to :ng_genre
  has_many :ng_tagging_contents, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :ng_expression, presence: true
  def voted_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
