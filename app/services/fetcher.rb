require "httparty"

class Fetcher
  URL = "https://api.coingecko.com/api/v3/simple/price"


  # coin: string, e.g., "bitcoin"
  # vs_currency: string, e.g., "usd"
  def self.get_price(coin, vs_currency = "usd")
    response = HTTParty.get("#{URL}?ids=#{coin}&vs_currencies=#{vs_currency}")
    return nil unless response.success?

    response[coin][vs_currency]
  rescue StandardError => e
    Rails.logger.error("CryptoPriceFetcher error: #{e.message}")
    nil
  end
end
