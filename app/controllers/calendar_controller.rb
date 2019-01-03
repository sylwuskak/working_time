class CalendarController < ApplicationController
  before_action :authenticate_user!

  def show_calendar
    @categories = current_user.categories

    if params['category_id'].nil? || params['category_id'].empty?
      @records = current_user.working_time_records
    else 
      @records = current_user.working_time_records.where(category_id: params['category_id'])
    end


  end
end