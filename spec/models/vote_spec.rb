# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'validation tests' do
    before(:each) do
      User.new(username: '123456789').save
      t = '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29'
      Project.new(title: '123456789', text: t, author_id: 1).save
    end

    it 'ensures user presence' do
      vote = Vote.new(project_id: 1).save
      expect(vote).to eq(false)
    end

    it 'ensures project presence' do
      vote = Vote.new(user_id: 1).save
      expect(vote).to eq(false)
    end

    it 'should save successfully' do
      vote = Vote.new(user_id: 1, project_id: 1).save
      expect(vote).to eq(true)
    end
  end
end
