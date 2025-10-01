class AlertMailer < ApplicationMailer
  default from: "cryptoalert@example.com"

  def threshold_crossed(alert, current_price)
    @alert = alert
    @current_price = current_price
    mail(to: "user@example.com", subject: "Crypto Alert: #{alert.coin}")
  end
end
