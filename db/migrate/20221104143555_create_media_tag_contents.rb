class CreateMediaTagContents < ActiveRecord::Migration[6.1]
  def change
    create_table :media_tag_contents do |t|

      t.references :media_genre
      t.references :content
      t.timestamps
    end
  end
end
