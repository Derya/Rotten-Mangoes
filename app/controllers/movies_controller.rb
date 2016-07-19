class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
    @movies = Movie.all
    @movies = @movies.where("title like :var1", var1: params[:title]) unless params[:title].blank?
    @movies = @movies.where("director like :var1", var1: params[:director]) unless params[:director].blank?
    if params[:runtime_in_minutes]
      case params[:runtime_in_minutes]
      when "1"
        min = 0
        max = 89
      when "2"
        min = 90
        max = 120
      when "3"
        min = 121
        max = nil
      else
        min = nil
        max = nil
      end
      @movies = @movies.where("runtime_in_minutes >= :var1", var1: min) unless min.nil?
      @movies = @movies.where("runtime_in_minutes <= :var1", var1: max) unless max.nil?
    end
    render :index
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(:title, :release_date, :director, :poster_image, :runtime_in_minutes, :description)
  end
  
end
