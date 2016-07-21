class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
    @movies = Movie.all

    @movies = @movies.search(params[:search_query]) unless params[:search_query].blank?
    @movies = @movies.duration_within(params[:min_runtime_in_minutes],params[:max_runtime_in_minutes]) unless params[:max_runtime_in_minutes].blank? && params[:min_runtime_in_minutes].blank?
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
