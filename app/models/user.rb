# typed: true

class User < ApplicationRecord
  extend T::Sig

  validates :email, uniqueness: true, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :zip_code, presence: true

  has_one :vote

  sig { returns(T::Boolean) }
  def has_voted?
    !!self.vote
  end
end
