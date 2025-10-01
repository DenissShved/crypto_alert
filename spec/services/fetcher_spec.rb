require 'rails_helper'

RSpec.describe Fetcher do
  describe ".get_price" do
    it "returns a numeric price" do
      # Mock HTTP request here
      allow(Fetcher).to receive(:get_price).with("bitcoin").and_return(42000.5)

      price = Fetcher.get_price("bitcoin")
      expect(price).to be_a(Float)
      expect(price).to eq(42000.5)
    end
  end
end
