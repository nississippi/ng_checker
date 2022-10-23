class StoryGenre < ApplicationRecord
  validates :story, presence: true
end
