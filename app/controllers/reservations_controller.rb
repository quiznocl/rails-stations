class ReservationsController < ApplicationController
    def index #座席表選択
        @movie=Movie.find(params[:movie_id])
        @sheets=Sheet.all
        @schedule=Schedule.find(params[:schedule_id])  if params[:schedule_id].present?
        @date=params[:date] if params[:date].present?

        unless @date.present? && @schedule.present? 
          redirect_to movie_path(@movie.id), :status => 302
        end
    end

    def new
        @movie=Movie.find(params[:movie_id])
        @schedule=Schedule.find(params[:schedule_id]) if params[:schedule_id].present?
        @sheet=Sheet.find(params[:sheet_id]) if params[:sheet_id].present?
        @date=params[:date] if params[:date].present?

        unless  @date.present? && @sheet.present? &&  @schedule.present?
            redirect_to movie_path(@movie.id), :status => 302
        end
        @reservation=Reservation.new()
    end

    def create
        @movie=Movie.find(params[:reservation][:movie_id])
        @schedule=Schedule.find(params[:reservation][:schedule_id])
        @sheet=Sheet.find(params[:reservation][:sheet_id])
        @date=params[:reservation][:date]


        @reservation = Reservation.new(reservation_params)
    
        if @reservation.save
          flash[:success] = "予約が完了しました"
          redirect_to movie_path(@movie.id)
        else
          flash[:alert] = "予約済みの席ですよ"
          redirect_to movie_schedule_sheets_path(movie_id: @movie.id, schedule_id: @schedule.id, date: @date), :status => 302
        end
    end

    private
    def reservation_params
      params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
    end

end

#http://localhost:3000/movies/1/reservation?date=2022-10-27&schedule_id=1
#http://localhost:3000/movies/1/reservation?schedule_id=1&date=2022-10-27　座席表

#http://localhost:3000/movies/1/schedules/1/reservations/new?date=2022-10-27&sheet_id=1 ご予約ページ
#http://localhost:3000/movies/1/schedules/1/reservations/new ご予約ページ(目標)

#http://localhost:3000/movies/1/schedules/1/sheets?date=2019-04-16 ここに飛ばされないといけないみたい(座席の選択)

#redirect_to movie_reservation_path(movie_id: @movie.id, schedule_id: @schedule.id, date: @date), :status => 302