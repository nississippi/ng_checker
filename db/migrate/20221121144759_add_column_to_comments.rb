class AddColumnToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :is_draft, :boolean, default: false, null: false
  end
end
