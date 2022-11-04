class MediaGenre < ApplicationRecord
  has_many :media_tag_contents, dependent: :destroy
  has_many :contents, through: :media_tag_contents
  validates :media, presence: true
end
