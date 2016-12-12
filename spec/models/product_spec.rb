require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @c1 = FactoryGirl.create(:category)
    @p1 = FactoryGirl.build(:product, category: @c1)
  end

  it 'should have a name, price, quantity, category' do
    expect(@p1.save).to be true
  end

  it 'should have a name' do
    @p1.name = nil
    expect(@p1.save).to be false
  end

  it 'should have a price' do
    @p1.price_cents = nil
    expect(@p1.save).to be false
  end

  it 'should have a quantity' do
    @p1.quantity = nil
    expect(@p1.save).to be false
  end

  it 'should have a category' do
    @p1.category = nil
    expect(@p1.save).to be false
  end
end
