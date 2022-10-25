class CreateNgTaggingContents < ActiveRecord::Migration[6.1]
  def change
    create_table :ng_tagging_contents do |t|

      t.references :ng_expression
      t.references :content
      t.timestamps
    end
  end
end
