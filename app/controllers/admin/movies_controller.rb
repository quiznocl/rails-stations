class Admin::MoviesController < ApplicationController
  def index
    @movies=Movie.all
  end

  def new
    @movie=Movie.new
  end

  
  def create
    @movie = Movie.new(user_params)
  

    if @movie.save
      redirect_to admin_movies_path
    else
      flash[:danger] = "エラー(入力フォームへ戻ります)"
      render admin_movies_new_path, state:400
    end
  end

  
  private
    def user_params
      params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
    end
  end
