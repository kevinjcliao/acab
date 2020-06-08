# typed: false
require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { line_item: { account_type: @line_item.account_type, acct: @line_item.acct, acct_and_desc: @line_item.acct_and_desc, category: @line_item.category, department: @line_item.department, department_alias: @line_item.department_alias, dept: @line_item.dept, division: @line_item.division, fund: @line_item.fund, fund_and_desc: @line_item.fund_and_desc, org: @line_item.org, org_and_desc: @line_item.org_and_desc, prog: @line_item.prog, prog_and_desc: @line_item.prog_and_desc, project: @line_item.project, project_and_desc: @line_item.project_and_desc, rev_or_exp: @line_item.rev_or_exp, service_area: @line_item.service_area, service_area_alias: @line_item.service_area_alias } }
    end

    assert_redirected_to line_item_url(LineItem.last)
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { account_type: @line_item.account_type, acct: @line_item.acct, acct_and_desc: @line_item.acct_and_desc, category: @line_item.category, department: @line_item.department, department_alias: @line_item.department_alias, dept: @line_item.dept, division: @line_item.division, fund: @line_item.fund, fund_and_desc: @line_item.fund_and_desc, org: @line_item.org, org_and_desc: @line_item.org_and_desc, prog: @line_item.prog, prog_and_desc: @line_item.prog_and_desc, project: @line_item.project, project_and_desc: @line_item.project_and_desc, rev_or_exp: @line_item.rev_or_exp, service_area: @line_item.service_area, service_area_alias: @line_item.service_area_alias } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end
end
