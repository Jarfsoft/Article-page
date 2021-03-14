# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :projectcategoryrelationships
  validates :name, :priority, presence: true
  validates :name, length: { minimum: 6, maximum: 30 }
end
