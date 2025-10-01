RSpec.describe CheckAlertsJob, type: :job do
  let(:user) { User.create!(name: "Test User", email: "test@example.com") }
  let!(:alert) { Alert.create!(user: user, coin: "bitcoin", condition: "above", target_price: 10_000) }

  it "triggers NotificationService if price matches condition" do
    allow(Fetcher).to receive(:get_price).and_return(20_000)
    allow(NotificationService).to receive(:send)

    CheckAlertsJob.perform_now

    expect(NotificationService).to have_received(:send).with(alert, 20_000)
  end
end
