# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

  def initialize
    super
    @rating_selection = Hash.new(1) 
    Movie.get_rating_values.each { |x| @rating_selection[x]   }
  end

  def index
    @movies = Movie.all
    if params.has_key?("ratings")
      @movies = Movie.where(rating: params["ratings"].keys)
      @rating_selection.each_key { |key|
        if params["ratings"].keys.include?(key)
          @rating_selection[key] = 1
        else
          @rating_selection[key] = 0 
        end
        }
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new

  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created"
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was succesfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice]  = "#{@movie.title} was succesfully deleted."
    redirect_to movies_path
  end

  def search_tmdb
    # hardwire to simulate failure
    flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
    redirect_to movies_path
  end

  def by_title
    @movies = Movie.order(title: :asc)
    @all_ratings = Movie.get_rating_values
    @title_style = 'hilite'
    render 'index'
  end

  def by_release
    @movies = Movie.order(release_date: :desc)
    @all_ratings = Movie.get_rating_values
    @release_style = 'hilite'
    render 'index'
  end

  private
  def movie_params
    params.require(:movie).permit! # security problem
  end


end
