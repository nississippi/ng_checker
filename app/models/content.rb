class Content < ApplicationRecord
  has_many :ng_tagging_contents, dependent: :destroy
  
end
