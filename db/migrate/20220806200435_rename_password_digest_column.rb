class RenamePasswordDigestColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password_disget, :password_digest
  end
end
