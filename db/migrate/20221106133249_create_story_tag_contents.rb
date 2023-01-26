class CreateStoryTagContents < ActiveRecord::Migration[6.1]
  def change
    create_table :story_tag_contents do |t|
      t.references :story_genre
      t.references :content
      t.timestamps
    end
  end
end
