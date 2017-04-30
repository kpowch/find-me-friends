require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should create a valid user' do
      user = User.create(
        first_name: "Paige",
        last_name: "Kato",
        email: "paige@meow.com",
        password: "1234PaigeIsAwesome",
        password_confirmation: "1234PaigeIsAwesome",
        dob: "1997-02-02",
        bio: "I am the best"
        )
      expect(user).to (be_valid)
    end
  end


end
