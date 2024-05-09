require 'csv'
text = 'こんにちは、ゔぁいおれっとさん'

has_tables = {
  'ゔ' => 'う”'
}

text.encode!(Encoding::SJIS, fallback: has_tables, invalid: :replace)

CSV.open('output.csv', 'wb', encoding: Encoding::SJIS) do |csv|
  csv << [text]
end
