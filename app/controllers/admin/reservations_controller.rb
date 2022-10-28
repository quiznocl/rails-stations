class Admin::ReservationsController < ApplicationController
    def index
        @reservations=Reservation.all
    end


    def new
        @reservation=Reservation.new()
        @sheets=Sheet.all
        @schedules=Schedule.all
    end

    def show
        @reservation = Reservation.find(params[:id]) if params[:id].present?
        @schedule=Schedule.find(@reservation.schedule_id)
        @sheet=Sheet.find(@reservation.sheet_id)
        @movie=Movie.find(@schedule.movie_id)
        @date=@reservation.date

        unless @reservation.present? 
          redirect_to admin_reservations_path, :status => 302
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
      
    
        if @reservation.save
            redirect_to admin_reservations_path
        else
          flash[:danger] = "予約済みの席でしたよ"
          redirect_to new_admin_reservation_path, :status => 400
        end
      end

    def update
        @reservation = Reservation.find(params[:id]) 
    
        if @reservation.update(reservation_params)
          redirect_to admin_reservations_path
        else
          flash[:danger] = "エラー(入力フォームへ戻ります)"
          redirect_to edit_admin_reservation_path(@reservation.id), state:400
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id]) 
    
        if @reservation.destroy
          redirect_to admin_reservations_path
        else
          redirect_to edit_admin_reservation_path(@reservation.id), state:400
        end
    end

    private
    def reservation_params
      params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
    end

end



#映画作品・座席・日時・名前・メールアドレス