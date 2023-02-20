require "application_system_test_case"

class CalculatorsTest < ApplicationSystemTestCase
  setup do
    @calculator = calculators(:one)
  end

  test "visiting the index" do
    visit calculators_url
    assert_selector "h1", text: "Calculators"
  end

  test "should create calculator" do
    visit calculators_url
    click_on "New calculator"

    fill_in "Body weight", with: @calculator.body_weight
    fill_in "Goal weight", with: @calculator.goal_weight
    fill_in "Protein", with: @calculator.protein
    click_on "Create Calculator"

    assert_text "Calculator was successfully created"
    click_on "Back"
  end

  test "should update Calculator" do
    visit calculator_url(@calculator)
    click_on "Edit this calculator", match: :first

    fill_in "Body weight", with: @calculator.body_weight
    fill_in "Goal weight", with: @calculator.goal_weight
    fill_in "Protein", with: @calculator.protein
    click_on "Update Calculator"

    assert_text "Calculator was successfully updated"
    click_on "Back"
  end

  test "should destroy Calculator" do
    visit calculator_url(@calculator)
    click_on "Destroy this calculator", match: :first

    assert_text "Calculator was successfully destroyed"
  end
end
