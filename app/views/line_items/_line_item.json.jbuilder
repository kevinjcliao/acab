json.extract! line_item, :id, :department, :division, :dept, :department_alias, :service_area, :service_area_alias, :fund, :fund_and_desc, :org, :org_and_desc, :project, :project_and_desc, :prog, :prog_and_desc, :account_type, :rev_or_exp, :acct_and_desc, :category, :acct, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
