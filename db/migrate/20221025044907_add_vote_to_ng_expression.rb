class AddVoteToNgExpression < ActiveRecord::Migration[6.1]
  def change
    add_column :ng_expressions, :vote, :integer
  end
end
