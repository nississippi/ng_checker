class Content < ApplicationRecord
  has_many :ng_tagging_contents, dependent: :destroy
  has_many :ng_expressions, through: :ng_tagging_contents
  has_many :ng_answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :media_tag_contents, dependent: :destroy
  has_many :media_genres, through: :media_tag_contents
  has_many :story_tag_contents, dependent: :destroy
  has_many :story_genres, through: :story_tag_contents


  validates :title, presence: true
end
