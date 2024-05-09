require 'csv'
text = 'こんにちは、ゔぁいおれっとさん'

has_tables = {
  'ゔ' => 'う”'
}

kana_converter = ->(text) { has_tables.fetch(text, '?') }
text.encode!(Encoding::SJIS, fallback: kana_converter, invalid: :replace)

CSV.open('output.csv', 'wb', encoding: Encoding::SJIS) do |csv|
  csv << [text]
end
