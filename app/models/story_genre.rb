class StoryGenre < ApplicationRecord
  has_many :story_tag_contents, dependent: :destroy
  has_many :contents, through: :story_tag_contents

  validates :story, presence: true
end
