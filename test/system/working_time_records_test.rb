require "application_system_test_case"

class WorkingTimeRecordsTest < ApplicationSystemTestCase
  setup do
    @working_time_record = working_time_records(:one)
  end

  test "visiting the index" do
    visit working_time_records_url
    assert_selector "h1", text: "Working Time Records"
  end

  test "creating a Working time record" do
    visit working_time_records_url
    click_on "New Working Time Record"

    fill_in "Date", with: @working_time_record.date
    fill_in "Datetime", with: @working_time_record.datetime
    click_on "Create Working time record"

    assert_text "Working time record was successfully created"
    click_on "Back"
  end

  test "updating a Working time record" do
    visit working_time_records_url
    click_on "Edit", match: :first

    fill_in "Date", with: @working_time_record.date
    fill_in "Datetime", with: @working_time_record.datetime
    click_on "Update Working time record"

    assert_text "Working time record was successfully updated"
    click_on "Back"
  end

  test "destroying a Working time record" do
    visit working_time_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Working time record was successfully destroyed"
  end
end
