class Content < ApplicationRecord
  has_many :ng_tagging_contents, dependent: :destroy
  has_many :ng_expressions, through: :ng_tagging_contents
  has_many :ng_answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
end