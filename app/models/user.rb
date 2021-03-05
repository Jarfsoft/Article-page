class User < ApplicationRecord
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 6, maximum: 25 }
end
