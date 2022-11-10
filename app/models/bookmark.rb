class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :ng_expression
end
