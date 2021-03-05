class User < ApplicationRecord
  has_many :votes
  has_many :projects
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 6, maximum: 25 }
end
