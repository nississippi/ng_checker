class CreateNgAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :ng_answers do |t|
      t.references :ng_expression
      t.references :customer
      t.references :content
      t.integer :vote
      t.timestamps
    end
  end
end
