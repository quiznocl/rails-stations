class Admin::SchedulesController < ApplicationController

    def index
        @movies=Movie.all
        @schedules=Schedule.all
    end


    def edit
        @schedule=Schedule.find(params[:id]) 
    end

    def new
        @schedule=Schedule.new()
    end

    def update
        @schedule = Schedule.find(params[:id]) 
    
        if @schedule.update(user_params)
          redirect_to admin_schedules_path
        else
          flash[:danger] = "エラー(入力フォームへ戻ります)"
          redirect_to edit_admin_schedule_path, state:400
        end
    end

    def destroy
        @schedule = Schedule.find(params[:id]) 
    
        if @schedule.destroy
          redirect_to admin_schedule_path
        else
          redirect_to admin_schedule_path, state:400
        end
    end

    def create
        @schedule = Schedule.new(user_params)
      
    
        if @schedule.save
            redirect_to admin_schedules_path
        else
          flash[:danger] = "エラー(入力フォームへ戻ります)"
          render new_admin_schedule_path, state:400
        end
    end

    private
    def user_params
      params.require(:schedule).permit(:start_time, :end_time)
    end

end
