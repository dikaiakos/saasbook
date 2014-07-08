class Movie < ActiveRecord::Base

  def self.rating_values
    ['G', 'PG', 'PG-13', 'R', 'NC-17']
  end

end
