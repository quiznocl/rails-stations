class SheetsController < ApplicationController
  def index
    @sheets=Sheet.all 
    @movie=Movie.find(params[:movie_id])
    @schedule=Schedule.find(params[:schedule_id]) if params[:schedule_id].present?
    @date=params[:date] if params[:date].present?

    unless @date.present? && @schedule.present? 
      redirect_to movie_path(@movie.id), :status => 302
    end
  end
end
