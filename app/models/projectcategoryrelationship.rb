class Projectcategoryrelationship < ApplicationRecord
  belongs_to :project
  belongs_to :category
  validates :project_id, :category_id, presence: true
end
