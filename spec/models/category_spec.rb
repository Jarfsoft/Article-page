require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      category = Category.new(priority: 1).save
      expect(category).to eq(false)
    end

    it 'ensures priority presence' do
      category = Category.new(name: '12345678').save
      expect(category).to eq(false)
    end

    it 'ensures name to have more than 6 characters' do
      category = Category.new(name: '123', priority: 1).save
      expect(category).to eq(false)
    end

    it 'ensures name to have less than 25 characters' do
      category = Category.new(name: '1 2 3 5 6 7 8 9 10 11 12 13 14', priority: 1).save
      expect(category).to eq(false)
    end

    it 'should save successfully' do
      category = Category.new(name: '1 2 3 5 6 7 8 9', priority: 1).save
      expect(category).to eq(true)
    end
  end
end
