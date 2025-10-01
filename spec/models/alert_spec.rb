require 'rails_helper'

RSpec.describe Alert, type: :model do
  let(:user) { User.create!(name: "Test User", email: "test@example.com") }

  it "is valid with valid attributes" do
    alert = Alert.new(user: user, coin: "bitcoin", condition: "above", target_price: 50_000)
    expect(alert).to be_valid
  end

  it "is invalid without a coin" do
    alert = Alert.new(user: user, coin: nil, condition: "above", target_price: 50_000)
    expect(alert).not_to be_valid
    expect(alert.errors[:coin]).to include("can't be blank")
  end

  it "is invalid with unsupported condition" do
    alert = Alert.new(user: user, coin: "bitcoin", condition: "sideways", target_price: 50_000)
    expect(alert).not_to be_valid
    expect(alert.errors[:condition]).to include("is not included in the list")
  end
end
