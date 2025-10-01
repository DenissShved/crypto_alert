class CheckAlertsJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "CheckAlertsJob started at #{Time.current}"
    Alert.includes(:user).find_each do |alert|
      current_price = Fetcher.get_price(alert.coin)
      next unless current_price

      trigger = false
      if alert.condition == "above"
        trigger = current_price > alert.target_price
      else
        trigger = current_price < alert.target_price
      end

      if trigger
        NotificationService.send(alert, current_price)
        Rails.logger.info "Alert triggered for #{alert.coin} at #{current_price}"
      end
    end
  end
end
