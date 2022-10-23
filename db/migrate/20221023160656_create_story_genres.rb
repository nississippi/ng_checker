class CreateStoryGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :story_genres do |t|

      t.string :story
      t.timestamps
    end
  end
end
