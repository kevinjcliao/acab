# frozen_string_literal: true

# typed: true
class LineItem < ApplicationRecord
  extend T::Sig

  def hello
    puts 'hello'
  end

  sig { returns(T::Hash[String, Integer]) }
  def self.funding_by_department
    LineItem.group(:department_alias).sum(:fy19_20_biennial_working_total)
  end
end
