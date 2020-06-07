# typed: strict
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Dir.chdir('data')
table = CSV.parse(File.read('FY19-21__Adopted.csv'), headers: true)
table&.each do |row|
  row = Hash[row.map do |value|
    value = T.cast(value, T::Array[T.nilable(String)])
    [T.must(value[0])
      .downcase
      .gsub(' ', '_')
      .gsub('-', '_')
      .gsub('rev_orexp', 'rev_or_exp')
      .to_sym,
     value[1] || ''
    ]
  end
  ]
  row = row.keep_if do |key, _value|
    !key.match('fy')
  end
  LineItem.create(**row)
end
