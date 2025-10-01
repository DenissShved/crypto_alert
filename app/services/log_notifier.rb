class LogNotifier
  def send(alert, current_price)
    Rails.logger.info("[ALERT] #{alert.coin} is #{alert.condition} #{alert.target_price} (current: #{current_price})")
  end
end
