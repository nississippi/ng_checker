class NgTaggingContent < ApplicationRecord
  belongs_to :ng_expression
  belongs_to :content
end
