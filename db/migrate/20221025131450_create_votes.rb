class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|

      t.integer :vote
      t.references :customer
      t.references :ng_expression
      t.timestamps
    end
  end
end
