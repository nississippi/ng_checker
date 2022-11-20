class ChangeDatatypeReleaseDateOfContents < ActiveRecord::Migration[6.1]
  def change
    change_column :contents, :release_date, :text
  end
end
