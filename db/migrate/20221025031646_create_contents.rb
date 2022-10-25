class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|

      t.string :title
      t.integer :release_year
      t.references :story_genre
      t.references :media_genre
      t.timestamps
    end
  end
end
