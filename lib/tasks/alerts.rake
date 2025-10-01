namespace :alerts do
  desc "Check all alerts against current prices"
  task check: :environment do
    puts "[#{Time.current}] Running alerts check..."
    CheckAlertsJob.perform_now
  end
end
