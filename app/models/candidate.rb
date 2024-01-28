# typed: true

class Candidate < ApplicationRecord
  validates :name, uniqueness: true

  has_many :votes
end
