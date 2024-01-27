# typed: true

class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :zip_code, presence: true
end
