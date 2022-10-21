class NgGenre < ApplicationRecord
  has_many :ng_expressions, dependent: :destroy

  validates :ng_genre, presence: true
end
