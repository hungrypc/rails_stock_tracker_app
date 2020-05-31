class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_a3206175d4ea446dbe4e0350061c2b25',  # for some reason, i cant store secrets
      secret_token: 'Tsk_4e0d2d1a1f8842a7b1966abe523af68dn',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
  end
end