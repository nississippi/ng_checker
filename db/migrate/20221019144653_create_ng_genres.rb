class CreateNgGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :ng_genres do |t|
      t.string :ng_genre, unique: true

      t.timestamps
    end
  end
end
