require 'test_helper'

class WorkingTimeRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @working_time_record = working_time_records(:one)
  end

  test "should get index" do
    get working_time_records_url
    assert_response :success
  end

  test "should get new" do
    get new_working_time_record_url
    assert_response :success
  end

  test "should create working_time_record" do
    assert_difference('WorkingTimeRecord.count') do
      post working_time_records_url, params: { working_time_record: { date: @working_time_record.date, datetime: @working_time_record.datetime } }
    end

    assert_redirected_to working_time_record_url(WorkingTimeRecord.last)
  end

  test "should show working_time_record" do
    get working_time_record_url(@working_time_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_working_time_record_url(@working_time_record)
    assert_response :success
  end

  test "should update working_time_record" do
    patch working_time_record_url(@working_time_record), params: { working_time_record: { date: @working_time_record.date, datetime: @working_time_record.datetime } }
    assert_redirected_to working_time_record_url(@working_time_record)
  end

  test "should destroy working_time_record" do
    assert_difference('WorkingTimeRecord.count', -1) do
      delete working_time_record_url(@working_time_record)
    end

    assert_redirected_to working_time_records_url
  end
end
