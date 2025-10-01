require 'rails_helper'

RSpec.describe AlertsController, type: :controller do
  let(:user) { User.create!(name: "Test User", email: "test@example.com") }

  describe "POST #create" do
    it "creates a new alert" do
      expect {
        post :create, params: { alert: { user_id: user.id, coin: "bitcoin", condition: "above", target_price: 50000 } }
      }.to change(Alert, :count).by(1)

      expect(response).to redirect_to(Alert.last)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the alert" do
      alert = Alert.create!(user: user, coin: "bitcoin", condition: "above", target_price: 50000)

      expect {
        delete :destroy, params: { id: alert.id }
      }.to change(Alert, :count).by(-1)

      expect(response).to redirect_to(alerts_path)
    end
  end
end
