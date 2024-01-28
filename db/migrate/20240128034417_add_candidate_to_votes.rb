class AddCandidateToVotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :votes, :candidate, foreign_key: true
  end
end
