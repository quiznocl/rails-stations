class Admin::MoviesController < ApplicationController
  def index
    @movies=Movie.all

  

    if(params[:keyword].present?)
      movies = @movies.where('((name LIKE ?) OR (description LIKE ?) ) ', "%#{params[:search]}%" , "%#{params[:search]}%") 
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

  def new
    @movie=Movie.new
  end

  
  def create
    @movie = Movie.new(user_params)
  

    if @movie.save
      redirect_to admin_movies_path
    else
      flash[:danger] = "エラー(入力フォームへ戻ります)"
      render new_admin_movie_path, state:400
    end
  end

  def edit
    @movie = Movie.find(params[:id]) 
  end

  def update
    @movie = Movie.find(params[:id]) 

    if @movie.update(user_params)
      redirect_to admin_movies_path
    else
      flash[:danger] = "エラー(入力フォームへ戻ります)"
      redirect_to edit_admin_movie_path, state:400
    end
  end

  def destroy
    @movie = Movie.find(params[:id]) 

    if @movie.destroy
      redirect_to admin_movies_path
    else
      redirect_to edit_admin_movie_path, state:400
    end
  end

  
  private
    def user_params
      params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
    end
  
  end
