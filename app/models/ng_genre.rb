class NgGenre < ApplicationRecord
  has_many :ng_expressions, dependent: :destroy
end
