class RenameReleaseYearColumnToContents < ActiveRecord::Migration[6.1]
  def change
    rename_column :contents, :release_year, :release_date
  end
end
