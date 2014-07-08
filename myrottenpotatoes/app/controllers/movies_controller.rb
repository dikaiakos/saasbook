# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController


  def index
    debugger
    if params[:commit] == 'Refresh' # triggered by clicking refersh button
      if !params[:ratings].nil? 
        @ratings = params[:ratings].keys
        session[:ratings] = params[:ratings].keys
      else # no rating parameter checked
        @ratings = nil
        session[:ratings] = nil
      end
    elsif params[:orderby].nil? # triggered by loading page
      @ratings = Movie.rating_values
      session[:ratings] = @ratings
    else # triggered by clicking on table header links
      @ratings = session[:ratings]
    end

    # need to figure out how to select and store at the same time
    @movies = Movie.where(rating: @ratings)
#    @movies = Movie.find(rating: @ratings, :order => "release_date desc")
    if !params[:orderby].nil? && params[:orderby] == 'title'
      @movies = Movie.where(rating: @ratings)
    end
    if !params[:orderby].nil? && params[:orderby] == 'release_date'
      @movies = @movies.where(rating: @ratings)
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



  private
  def movie_params
    params.require(:movie).permit! # security problem
  end


end
