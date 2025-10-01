class NotificationService
  CHANNELS = {
    log: "LogNotifier",
    email: "EmailNotifier"
    # later: telegram: "TelegramNotifier", etc.
  }

  def self.send(alert, current_price)
    CHANNELS.each_key do |channel|
      # TODO: Rewrite to less abstraction
      # Don't usually like this, as it makes it harder to search in the future. Here use for cimplicity
      notifier_class = CHANNELS[channel].constantize
      notifier_class.new.send(alert, current_price)
    end
  end
end
