class AddContentToNgAnswers < ActiveRecord::Migration[6.1]
  def change
    add_reference :ng_answers, :content, null: false, foreign_key: true
  end
end
