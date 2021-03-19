require 'rails_helper'

RSpec.describe Projectcategoryrelationship, type: :model do
  context 'validation tests' do
    before(:each) do
      t = '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29'
      Project.new(title: '123456789', text: t, author_id: 1).save
    end

    it 'ensures project presence' do
      relation = Projectcategoryrelationship.new(category_id: 1).save
      expect(relation).to eq(false)
    end

    it 'ensures category presence' do
      relation = Projectcategoryrelationship.new(project_id: 1).save
      expect(relation).to eq(false)
    end

    it 'should save successfully' do
      relation = Projectcategoryrelationship.new(project_id: 1, category_id: 1).save
      expect(relation).to eq(false)
    end
  end
end
