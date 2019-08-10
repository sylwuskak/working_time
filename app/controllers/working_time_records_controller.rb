class WorkingTimeRecordsController < ApplicationController
  before_action :authenticate_user!


  def index
    @working_time_records_all = current_user.working_time_records
    @working_time_records = @working_time_records_all.order(start_time: :desc).paginate(:page => params[:page], :per_page => 10)
    @today_time = @working_time_records_all.where(date: Date.today).sum{|a| a.end_time - a.start_time}
    @week_time = @working_time_records_all.select{|r| r.date <= Date.today && r.date >= Date.today.beginning_of_week}.sum{|a| a.end_time - a.start_time}
    @month_time = @working_time_records_all.select{|r| r.date <= Date.today && r.date >= Date.today.beginning_of_month}.sum{|a| a.end_time - a.start_time}
  end

  def create
    begin
      o = WorkingTimeRecord.new(adding_record_params)
      o.user = current_user
      o.save!
    rescue => e
      flash[:danger] = I18n.t('working_time_records.save_failure')
    end

    redirect_to working_time_records_path
  end

  def update 
    begin
      @working_time_records = WorkingTimeRecord.find(params[:id])
      @working_time_records.update!(record_params)
    rescue => e
      flash[:danger] = I18n.t('working_time_records.save_failure')
    end
    redirect_to working_time_records_path  
  end

  def destroy
    WorkingTimeRecord.destroy(params[:id])
    redirect_to working_time_records_path
  end

  def start 
    start_time = Time.now
    w = WorkingTimeRecord.new(date: Date.today, start_time: start_time, end_time: start_time, user: current_user, category: current_user.categories.where(category_name: "No category").first)
    w.save!
    redirect_to working_time_records_path
  end

  def end  
    end_time = Time.now
    w = current_user.working_time_records.last
    w.end_time = end_time
    w.save!
    redirect_to working_time_records_path
  end

  private

  def record_params
    params.require(:working_time_record).permit(:start_time, :end_time, :category_id)  
  end

  def adding_record_params
    a = params.require(:working_time_record).permit(:date, :start_time, :end_time, :category_id)
    a[:start_time] = a[:date] + ' ' + a[:start_time]
    a[:end_time] = a[:date] + ' ' + a[:end_time]
    a
  end

end
