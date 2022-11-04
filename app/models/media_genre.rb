class MediaGenre < ApplicationRecord
  #中間テーブル先に記述しないとエラー起こすかも
  has_many :media_tag_contents, dependent: :destroy
  has_many :contents, through: :media_tag_contents
  validates :media, presence: true
end
