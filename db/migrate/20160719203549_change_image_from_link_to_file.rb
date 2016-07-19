class ChangeImageFromLinkToFile < ActiveRecord::Migration[5.0]

  def self.up
    rename_column :movies, :poster_image_url, :poster_image
  end

  def self.down
    rename_column :movies, :poster_image, :poster_image_url
  end

end
