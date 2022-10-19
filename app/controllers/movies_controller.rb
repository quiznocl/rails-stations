class MoviesController < ApplicationController
  def index
    @movies=Movie.all

    if(params[:keyword].present?)
      movies = @movies.where('((name LIKE ?) OR (description LIKE ?) ) ', "%#{params[:keyword]}%" , "%#{params[:keyword]}%") 
    else
      movies=@movies
    end

    if(params[:search_showing]=="0")
      @movies=movies.where('is_showing=?','0')#上映中
    elsif(params[:search_showing]=="1")
      @movies=movies.where('is_showing=?','1')#上映予定
    else
      @movies=movies
    end
  end
end


