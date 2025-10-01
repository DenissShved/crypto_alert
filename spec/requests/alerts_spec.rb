require 'rails_helper'

RSpec.describe "/alerts", type: :request do
  let!(:user) { User.create!(name: "Test User", email: "test@example.com") }

  let(:valid_attributes) {
    { coin: "bitcoin", condition: "above", target_price: 50_000, user_id: user.id }
  }

  let(:invalid_attributes) {
    { coin: nil, condition: "sideways", target_price: nil, user_id: user.id }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Alert.create! valid_attributes
      get alerts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      alert = Alert.create! valid_attributes
      get alert_url(alert)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_alert_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      alert = Alert.create! valid_attributes
      get edit_alert_url(alert)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Alert" do
        expect {
          post alerts_url, params: { alert: valid_attributes }
        }.to change(Alert, :count).by(1)
      end

      it "redirects to the created alert" do
        post alerts_url, params: { alert: valid_attributes }
        expect(response).to redirect_to(alert_url(Alert.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Alert" do
        expect {
          post alerts_url, params: { alert: invalid_attributes }
        }.to change(Alert, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post alerts_url, params: { alert: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested alert" do
        alert = Alert.create! valid_attributes
        patch alert_url(alert), params: { alert: new_attributes }
        alert.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the alert" do
        alert = Alert.create! valid_attributes
        patch alert_url(alert), params: { alert: new_attributes }
        alert.reload
        expect(response).to redirect_to(alert_url(alert))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        alert = Alert.create! valid_attributes
        patch alert_url(alert), params: { alert: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested alert" do
      alert = Alert.create! valid_attributes
      expect {
        delete alert_url(alert)
      }.to change(Alert, :count).by(-1)
    end

    it "redirects to the alerts list" do
      alert = Alert.create! valid_attributes
      delete alert_url(alert)
      expect(response).to redirect_to(alerts_url)
    end
  end
end
