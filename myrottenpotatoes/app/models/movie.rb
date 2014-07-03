class Movie < ActiveRecord::Base

  RATINGS = ['G', 'PG', 'PG-13', 'R', 'NC-17']

  def Movie.get_rating_values
    return Movie::RATINGS
  end

end
