class CalendarController < ApplicationController
  before_action :authenticate_user!

  def show_calendar
    @records = current_user.working_time_records
  end
end