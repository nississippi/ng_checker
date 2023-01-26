class CreateMediaGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :media_genres do |t|

      t.string :media
      t.timestamps
    end
  end
end
