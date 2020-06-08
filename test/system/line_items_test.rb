# typed: false
require "application_system_test_case"

class LineItemsTest < ApplicationSystemTestCase
  setup do
    @line_item = line_items(:one)
  end

  test "visiting the index" do
    visit line_items_url
    assert_selector "h1", text: "Line Items"
  end

  test "creating a Line item" do
    visit line_items_url
    click_on "New Line Item"

    fill_in "Account type", with: @line_item.account_type
    fill_in "Acct", with: @line_item.acct
    fill_in "Acct and desc", with: @line_item.acct_and_desc
    fill_in "Category", with: @line_item.category
    fill_in "Department", with: @line_item.department
    fill_in "Department alias", with: @line_item.department_alias
    fill_in "Dept", with: @line_item.dept
    fill_in "Division", with: @line_item.division
    fill_in "Fund", with: @line_item.fund
    fill_in "Fund and desc", with: @line_item.fund_and_desc
    fill_in "Org", with: @line_item.org
    fill_in "Org and desc", with: @line_item.org_and_desc
    fill_in "Prog", with: @line_item.prog
    fill_in "Prog and desc", with: @line_item.prog_and_desc
    fill_in "Project", with: @line_item.project
    fill_in "Project and desc", with: @line_item.project_and_desc
    fill_in "Rev or exp", with: @line_item.rev_or_exp
    fill_in "Service area", with: @line_item.service_area
    fill_in "Service area alias", with: @line_item.service_area_alias
    click_on "Create Line item"

    assert_text "Line item was successfully created"
    click_on "Back"
  end

  test "updating a Line item" do
    visit line_items_url
    click_on "Edit", match: :first

    fill_in "Account type", with: @line_item.account_type
    fill_in "Acct", with: @line_item.acct
    fill_in "Acct and desc", with: @line_item.acct_and_desc
    fill_in "Category", with: @line_item.category
    fill_in "Department", with: @line_item.department
    fill_in "Department alias", with: @line_item.department_alias
    fill_in "Dept", with: @line_item.dept
    fill_in "Division", with: @line_item.division
    fill_in "Fund", with: @line_item.fund
    fill_in "Fund and desc", with: @line_item.fund_and_desc
    fill_in "Org", with: @line_item.org
    fill_in "Org and desc", with: @line_item.org_and_desc
    fill_in "Prog", with: @line_item.prog
    fill_in "Prog and desc", with: @line_item.prog_and_desc
    fill_in "Project", with: @line_item.project
    fill_in "Project and desc", with: @line_item.project_and_desc
    fill_in "Rev or exp", with: @line_item.rev_or_exp
    fill_in "Service area", with: @line_item.service_area
    fill_in "Service area alias", with: @line_item.service_area_alias
    click_on "Update Line item"

    assert_text "Line item was successfully updated"
    click_on "Back"
  end

  test "destroying a Line item" do
    visit line_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line item was successfully destroyed"
  end
end
