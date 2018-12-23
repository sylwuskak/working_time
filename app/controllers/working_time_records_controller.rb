class WorkingTimeRecordsController < ApplicationController
  before_action :authenticate_user!


  def index
    @working_time_records = current_user.working_time_records
  end

  def create
    begin
      o = WorkingTimeRecord.new(record_params)
      o.user = current_user
      o.save!
    rescue => e
      flash[:danger] = I18n.t('working_time_records.save_failure')
    end

    redirect_to working_time_records_path
  end

  private

  def record_params
    params.require(:working_time_record).permit(:date, :start_time, :end_time)  
  end

end
