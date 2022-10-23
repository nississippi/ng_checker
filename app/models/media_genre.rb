class MediaGenre < ApplicationRecord
  validates :media, presence: true
end
