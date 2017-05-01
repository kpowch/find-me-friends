require 'rails_helper'

RSpec.describe Friendship, type: :model do
 describe 'Validations' do
  it 'should create a valid friendship' do
    friendship = Friendship.create(
      user_id: 1,
      friend_id: 2,
      friendship_status: "pending"
      )
    expect(friendship).to be_valid
  end

  it 'should not save without a user id' do
    friendship = Friendship.create(
      user_id: nil,
      friend_id: 2,
      friendship_status: "pending"
      )
    expect(friendship).to_not be_valid
  end

  it 'should not save without a friend id' do
    friendship = Friendship.create(
      user_id: 1,
      friend_id: nil,
      friendship_status: "pending"
      )
    expect(friendship).to_not be_valid
  end

  it 'should not save without proper friendship status' do
    friendship = Friendship.create(
      user_id: 1,
      friend_id: 2,
      friendship_status: "catsRus"
      )
    expect(friendship).to_not be_valid
  end
 end
end
