# typed: strict
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'set'

FY_KEYS = T.let(
  Set[
    :fy18_19_midcycle_adopted_total,
    :fy19_20_biennial_working_total,
    :fy20_21_biennial_working_total
  ],
  T::Set[Symbol]
)

puts 'Hey there! Starting to read the Oakland City Budget for FY19-21.'

Dir.chdir('data')
table = CSV.parse(File.read('FY19-21__Adopted.csv'), headers: true)
table&.each do |row|
  row = Hash[row.map do |value|
    value = T.cast(value, T::Array[T.nilable(String)])
    [T.must(value[0])
      .downcase
      .gsub(' ', '_')
      .gsub('-', '_')
      .gsub("\n", '')
      .gsub('rev_orexp', 'rev_or_exp')
      .to_sym,
     value[1] || ''
    ]
  end
  ]

  row = row.keep_if do |key, _value|
    !key.match('fy') || FY_KEYS.include?(key)
  end

  row = Hash[row.map do |key, value|
    [key, FY_KEYS.include?(key) ? value.to_i : value]
  end]
  LineItem.create(**row)
end

puts 'All done! Have fun!'
