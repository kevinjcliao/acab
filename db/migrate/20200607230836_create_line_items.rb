class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.string :department
      t.string :division
      t.string :dept
      t.string :department_alias
      t.string :service_area
      t.string :service_area_alias
      t.string :fund
      t.string :fund_and_desc
      t.string :org
      t.string :org_and_desc
      t.string :project
      t.string :project_and_desc
      t.string :prog
      t.string :prog_and_desc
      t.string :account_type
      t.string :rev_or_exp
      t.string :acct_and_desc
      t.string :category
      t.integer :acct

      t.timestamps
    end
  end
end
