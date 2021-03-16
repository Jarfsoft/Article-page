require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validation tests' do
    before(:each) do
      User.new(username: '123456789').save
    end
    it 'ensures title presence' do
      project = Project.new(text: '1 2 3 4 5 6 7 8 9 10 11 12 13 ', author_id: 1).save
      expect(project).to eq(false)
    end

    it 'ensures text presence' do
      project = Project.new(title: '12345678', author_id: 1).save
      expect(project).to eq(false)
    end

    it 'ensures text to have more than 30 caracters' do
      project = Project.new(title: '12345678', text: '123456789', author_id: 1).save
      expect(project).to eq(false)
    end

    it 'should save successfully' do
      t = '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29'
      project = Project.new(title: '123456789', text: t, author_id: 1).save
      expect(project).to eq(true)
    end
  end
end
