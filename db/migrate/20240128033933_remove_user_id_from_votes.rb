# typed: true

class RemoveUserIdFromVotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :votes, :user_id, :integer
  end
end
