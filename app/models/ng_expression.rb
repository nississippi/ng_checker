class NgExpression < ApplicationRecord
  belongs_to :ng_genre
  has_many :ng_tagging_contents, dependent: :destroy
  has_many :ng_answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :contents, through: :ng_tagging_contents

  validates :ng_expression, presence: true
end
