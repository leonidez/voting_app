class AddSessionExpiresToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :session_expires, :datetime
  end
end
