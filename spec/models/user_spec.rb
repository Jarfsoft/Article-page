# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.new.save
      expect(user).to eq(false)
    end

    it 'ensures username to have more than 6 characters' do
      user = User.new(username: '123').save
      expect(user).to eq(false)
    end

    it 'ensures username to have less than 25 characters' do
      user = User.new(username: 'abcdefghijklmnopqrstuvwxyz').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(username: 'abcdefg').save
      expect(user).to eq(true)
    end
  end
end
