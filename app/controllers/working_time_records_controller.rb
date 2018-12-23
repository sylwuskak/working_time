class WorkingTimeRecordsController < ApplicationController
  before_action :authenticate_user!


  def index
    @working_time_records = current_user.working_time_records
  end

  
end
