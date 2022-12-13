class AddDetailsToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :tmdb_id, :integer
  end
end
