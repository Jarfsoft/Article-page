class Project < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  validates :author_id, :title, :text, presence: true
  validates :title, length: { minimum: 8, maximum: 100 }
  validates :text, length: { minimum: 30, maximum: 5000 }
end
