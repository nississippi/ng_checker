class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|

      t.string :title
      t.string :release_date
      t.integer :tmdb_id, null: false
      t.timestamps
    end
  end
end
