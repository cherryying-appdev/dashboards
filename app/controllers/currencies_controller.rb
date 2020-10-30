class CurrenciesController < ApplicationController
  def first_currency
    # require "open-uri"
    raw_data = open("https://api.exchangerate.host/symbols").read
    parsed_data = JSON.parse(raw_data)
    symbols_hash = parsed_data.fetch("symbols")
    @array_of_symbols = symbols_hash.keys
    render({ :template => "currency_templates/step_one.html.erb"})
  end

  def second_currency
    raw_data = open("https://api.exchangerate.host/symbols").read
    parsed_data = JSON.parse(raw_data)
    symbols_hash = parsed_data.fetch("symbols")
    @array_of_symbols = symbols_hash.keys

    # Paramaters: {"from_currency" => "ARS"}
    @from_symbol = params.fetch("from_currency")
    render({ :template => "currency_templates/step_two.html.erb"})
  end
end