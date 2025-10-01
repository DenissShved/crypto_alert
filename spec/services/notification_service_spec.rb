require 'rails_helper'

RSpec.describe NotificationService do
  let(:user) { User.create!(name: "Test User", email: "test@example.com") }
  let(:alert) { Alert.create!(user: user, coin: "bitcoin", condition: "above", target_price: 50_000) }

  it "delegates notification to all channels" do
    # Fake notifiers
    log_notifier = double("LogNotifier")
    email_notifier = double("EmailNotifier")

    allow(LogNotifier).to receive(:new).and_return(log_notifier)
    allow(EmailNotifier).to receive(:new).and_return(email_notifier)

    allow(log_notifier).to receive(:send)
    allow(email_notifier).to receive(:send)

    NotificationService.send(alert, 51_000)

    expect(log_notifier).to have_received(:send).with(alert, 51_000)
    expect(email_notifier).to have_received(:send).with(alert, 51_000)
  end
end
