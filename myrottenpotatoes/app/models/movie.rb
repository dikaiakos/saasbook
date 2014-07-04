class Movie < ActiveRecord::Base

  RATING_VALUES = ['G', 'PG', 'PG-13', 'R', 'NC-17']

  def Movie.get_rating_values
    Movie::RATING_VALUES
  end

end
