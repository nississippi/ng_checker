class Content < ApplicationRecord
  has_many :ng_tagging_contents, dependent: :destroy
  has_many :contents, through: :ng_tagging_contents
  has_many :ng_answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :media_tag_contents, dependent: :destroy
  has_many :media_genres, through: :media_tag_contents
  has_many :story_tag_contents, dependent: :destroy
  has_many :story_genres, through: :story_tag_contents

  def self.looks(searches, words)
    if searches == "perfect_match"
      @content = Content.where("title LIKE ?", "#{words}")
    else
      @content = Content.where("title LIKE ?", "%#{words}%")
    end
  end
end
