class CreateNgExpressions < ActiveRecord::Migration[6.1]
  def change
    create_table :ng_expressions do |t|
      t.references :ng_genre, null: false, foreign_key: true
      t.string :ng_expression, unique: true

      t.timestamps
    end
  end
end
