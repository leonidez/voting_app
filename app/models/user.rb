class User < ApplicationRecord
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
end
