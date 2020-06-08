class AddFundingNumberToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :fy18_19_midcycle_adopted_total, :integer
    add_column :line_items, :fy19_20_biennial_working_total, :integer
    add_column :line_items, :fy20_21_biennial_working_total, :integer
  end
end
