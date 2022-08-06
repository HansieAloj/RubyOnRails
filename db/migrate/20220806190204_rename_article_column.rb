class RenameArticleColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :updates_at, :updated_at
  end
end
