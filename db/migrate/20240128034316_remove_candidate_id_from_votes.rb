# typed: true

class RemoveCandidateIdFromVotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :votes, :candidate_id, :integer
  end
end
