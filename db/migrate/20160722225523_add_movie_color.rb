class AddMovieColor < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :color, :int
  end
end
