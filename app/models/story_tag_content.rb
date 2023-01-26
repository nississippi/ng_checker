class StoryTagContent < ApplicationRecord
  belongs_to :story_genre
  belongs_to :content
end
