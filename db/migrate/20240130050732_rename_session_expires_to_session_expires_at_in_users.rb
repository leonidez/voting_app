class RenameSessionExpiresToSessionExpiresAtInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :session_expires, :session_expires_at
  end
end
