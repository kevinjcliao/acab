# ACAB: Allowing Citizens to Access the Budget

## About
This is a project to input the 2019-2021 Oakland City Budget into a Rails
project. This allows us to write ActiveRecord queries and do data visualization.
All this project currently does is reads in the budget as a CSV file into an
SQLite table. 

## Installation
* I recommend using rbenv to install Ruby. Install the Ruby version specified in
  the repo. 
* `bundle install` will get you all the Gems you need to get the project
  running.
* Seed the database with `bundle exec rails db:seed`. This may take a couple
  minutes to run.
* Run the server with `bundle exec rails server`
* Run ORM queries in `rails console`
* Check out all the data in `localhost:3000/line_items`

## Other notes: 
* This project is type checked by Sorbet. The lil squiggly type checker
  annotations may make the Ruby look unusual, but I really wanted to play with
  it because it seems cool. Sorbet is a static type checker for Ruby that the
  good folks over at Stripe are working on.

## Sample queries: 
### Line item count: (group line items by department)
```
irb(main):001:0> LineItem.group(:dept).count
   (1.8ms)  SELECT sqlite_version(*)
   (173.0ms)  SELECT COUNT(*) AS count_all, "line_items"."dept" AS
   line_items_dept FROM "line_items" GROUP BY "line_items"."dept"
=> {"DP01"=>151, "DP02"=>215, "DP03"=>873, "DP04"=>1155, "DP05"=>47,
   "DP06"=>307, "DP07"=>76, "DP08"=>38, "DP09"=>2389, "DP10"=>1175, "DP11"=>25,
   "DP12"=>589, "DP13"=>45, "DP14"=>6288, "DP15"=>2012, "DP16"=>2116,
   "DP17"=>4091, "DP18"=>6446, "DP19"=>1903, "DP20"=>1642, "DP21"=>1599,
   "DP22"=>5947, "DP23"=>6041, "DP24"=>930, "DP25"=>741, "ERROR: #N/A"=>18}
irb(main):002:0> LineItem.group(:department).count
   (55.8ms)  SELECT COUNT(*) AS count_all, "line_items"."department" AS
   line_items_department FROM "line_items" GROUP BY "line_items"."department"
=> {"DP010 - Mayor"=>151, "DP020 - City Administrator"=>894, "DP030 - City
   Clerk"=>307, "DP040 - City Attorney"=>1155, "DP050 - Human Resources
   Management Department"=>581, "DP070 - City Auditor"=>47, "DP080 - Finance
   Department"=>2380, "DP1000 - Police Department"=>6288, "DP200 - Fire
   Department"=>2012, "DP300 - Oakland Public Works Department"=>6227, "DP350 -
   Department of Transportation"=>5761, "DP460 - Information Technology
   Department"=>1175, "DP5000 - Oakland Parks and Recreation Department"=>4091,
   "DP610 - Oakland Public Library Department"=>2116, "DP640 - Race and Equity
   Department"=>25, "DP650 - Public Ethics Commission"=>38, "DP660 - Police
   Commission"=>72, "DP700 - Department of Violence Prevention"=>45, "DP750 -
   Human Services Department"=>6446, "DP840 - Planning and Building
   Department"=>1599, "DP850 - Economic and Workforce Development
   Department"=>1903, "DP890 - Housing and Community Development
   Department"=>1642, "DP900 - Non Departmental and Port"=>930, "DP940 - Capital
   Improvement Projects"=>738, "DP950 - Oakland Redevelopment Agency (ORA)"=>3,
   "DPCC0 - City Council"=>215, "DPCLR - Default / Clearing Organization"=>18} 
irb(main):003:0> LineItem.group(:department_alias).count
   (45.1ms)  SELECT COUNT(*) AS count_all, "line_items"."department_alias" AS
   line_items_department_alias FROM "line_items" GROUP BY
   "line_items"."department_alias"
=> {""=>18, "Capital Improvement Projects"=>741, "City Administrator"=>873,
"City Attorney"=>1155, "City Auditor"=>47, "City Clerk"=>307, "City
Council"=>215, "Department of Violence Prevention"=>45, "Economic & Workforce
Development"=>1903, "Finance Department"=>2389, "Fire Department"=>2012,
"Housing & Community Development"=>1642, "Human Resources Management
Department"=>589, "Human Services"=>6446, "Information Technology"=>1175,
"Mayor"=>151, "Non"=>930, "Oakland Parks, Recreation & Youth Development"=>4091,
"Oakland Public Library"=>2116, "Oakland Public Works"=>5947, "Planning &
Building"=>1599, "Police Commission"=>76, "Police Department"=>6288, "Public
Ethics Commission"=>38, "Race & Equity"=>25, "Transportation"=>6041} 
```
