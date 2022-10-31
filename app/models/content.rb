class Content < ApplicationRecord
  has_many :ng_tagging_contents, dependent: :destroy
  has_many :ng_expressions, through: :ng_tagging_contents
  has_many :ng_answers, dependent: :destroy

  def answered_by?(customer, ng_expression, vote)
    ng_answers.exists?(customer_id: customer.id, ng_expression_id: ng_expression.id, vote: vote)
  end
end
