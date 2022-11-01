class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :ng_expression
      t.references :customer
      t.references :content
      t.string :comment

      t.timestamps
    end
  end
end
