require 'rails_helper'

RSpec.describe User, type: :model do

  pending describe 'Validations' do
    it 'should create a valid user' do
      user = User.create(
        first_name: "Paige",
        last_name: "Kato",
        email: "paige@meows.com",
        password: "1234PaigeIsAwesome",
        password_confirmation: "1234PaigeIsAwesome",
        dob: "1997-02-02",
        bio: "I am the best"
        )
      expect(user).to (be_valid)
    end

    it 'should have password digest' do
      user = User.create(
        first_name: "Paige",
        last_name: "Kato",
        email: "paige@meows.com",
        password_digest: "wlkfmewlkfmweflkmwefk",
        dob: "1997-02-02",
        bio: "I am the best"
        )
      expect(user).to_not be_valid
    end

    it 'should not save without a unique email' do
      @user = User.create(
        first_name: "Paige",
        last_name: "Kato",
        email: "paige@meows.com",
        password: "wlkfmewlkfmweflkmwefk",
        password_confirmation: "wlkfmewlkfmweflkmwefk",
        dob: "1997-02-02",
        bio: "I am the best"
        )
      @user2 = User.create(
        first_name: "Paige",
        last_name: "Kato",
        email: "paige@meows.com",
        password: "wlkfmewlkfmweflkmwefk",
        password_confirmation: "wlkfmewlkfmweflkmwefk",
        dob: "1997-02-02",
        bio: "I am the best"
        )
      expect(@user2).to_not be_valid
    end

    it 'should have a valid first name' do
      user = User.create(
        first_name: nil,
        last_name: "Kato",
        email: "paige@meows.com",
        password: "wlkfmewlkfmweflkmwefk",
        password_confirmation: "wlkfmewlkfmweflkmwefk",
        dob: "1997-02-02",
        bio: "I am the best"
        )
      expect(user).to_not be_valid
    end

    it 'should have a valid last name' do
      user = User.create(
        first_name: "Raige",
        last_name: nil,
        email: "paige@meows.com",
        password: "wlkfmewlkfmweflkmwefk",
        password_confirmation: "wlkfmewlkfmweflkmwefk",
        dob: "1997-02-02",
        bio: "I am the best"
        )
      expect(user).to_not be_valid
    end

    it 'should not save without a DOB' do
      user = User.create(
        first_name: "Sarage",
        last_name: "Kato",
        email: "paige@meows.com",
        password: "wlkfmewlkfmweflkmwefk",
        password_confirmation: "wlkfmewlkfmweflkmwefk",
        dob: nil,
        bio: "I am the best"
        )
      expect(user).to_not be_valid
    end

    it 'should not allow users under 18 to signup' do
      user = User.create(
        first_name: "Sarage",
        last_name: "Kato",
        email: "paige@meows.com",
        password: "wlkfmewlkfmweflkmwefk",
        password_confirmation: "wlkfmewlkfmweflkmwefk",
        dob: "2015-01-01",
        bio: "I am the best"
        )
      expect(user).to_not be_valid
    end

  end


end
