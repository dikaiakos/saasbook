# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
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
    @title_style = 'hilite'
    render 'index'
  end

  def by_release
    @movies = Movie.order(release_date: :desc)
    @release_style = 'hilite'
    render 'index'
  end

  private
  def movie_params
    params.require(:movie).permit! # security problem
  end


end
