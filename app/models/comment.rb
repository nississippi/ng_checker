class Comment < ApplicationRecord
  belongs_to :ng_expression
  belongs_to :customer
  belongs_to :content

  validates :comment, presence: true
end
