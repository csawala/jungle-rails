require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Product validations' do
    before(:each) do
      @c1 = FactoryGirl.create(:category)
      @p1 = FactoryGirl.build(:product, category: @c1)
    end

    it 'should validate name, price, quantity, category' do
      expect(@p1.save).to be true
    end

    it 'should validate name' do
      @p1.name = nil
      expect(@p1.save).to be false
    end

    it 'should validate price' do
      @p1.price_cents = nil
      expect(@p1.save).to be false
    end

    it 'should validate quantity' do
      @p1.quantity = nil
      expect(@p1.save).to be false
    end

    it 'should validate category' do
      @p1.category = nil
      expect(@p1.save).to be false
    end
  end
end
