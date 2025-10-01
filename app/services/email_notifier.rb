class EmailNotifier
  def send(alert, current_price)
    AlertMailer.threshold_crossed(alert, current_price).deliver_later
  end
end
