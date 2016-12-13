require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @u1 = FactoryGirl.build(:user)
    end

    it 'should require a password field' do
      @u1.password = nil
      expect(@u1.valid?).to be false
    end

    it 'should require a minimum password length of 8' do
      @u1.password = '1234567'
      @u1.password_confirmation = '1234567'
      expect(@u1.valid?).to be false
    end

    it 'should require a password_confirmation field' do
      @u1.password_confirmation = nil
      expect(@u1.valid?).to be false
    end

    it 'should require matching passwords' do
      @u1.password = 'match'
      @u1.password_confirmation = 'notmatch'
      expect(@u1.valid?).to be false
    end

    it 'should require an email' do
      @u1.email = nil
      expect(@u1.valid?).to be false
    end

    it 'should validate unique emails' do
      @u2 = FactoryGirl.create(:user, email: 'test@test.com')
      @u1.email = 'test@test.com'
      expect(@u1.valid?).to be false
    end

    it 'should validate case insensitive emails' do
      @u2 = FactoryGirl.create(:user, email: 'test@test.COM')
      @u1.email = 'TEST@TEST.com'
      expect(@u1.valid?).to be false
    end

    it 'should require a first_name' do
      @u1.first_name = nil
      expect(@u1.valid?).to be false
    end

    it 'should require a last_name' do
      @u1.last_name = nil
      expect(@u1.valid?).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @u1 = FactoryGirl.build(:user)
      @u1.email = 'test@test.com'
      @u1.password = 'password'
      @u1.password_confirmation = 'password'
      @u1.save
    end

    it 'should authenticate a user inputting whitespace' do
      user = User.authenticate_with_credentials('    test@test.com   ', 'password')
      expect(user).to eq(@u1)
    end

    it 'should authenticate a user with random caps' do
      user = User.authenticate_with_credentials('TEst@teSt.cOM', 'password')
      expect(user).to eq(@u1)
    end
  end
end


