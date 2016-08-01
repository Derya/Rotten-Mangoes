class Movie < ApplicationRecord

  mount_uploader :poster_image, PosterImageUploader

  before_save :set_color
  
  has_many :reviews
  
  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  def self.duration_within(mintime,maxtime)
    if mintime.blank?
      where("runtime_in_minutes <= :var1", var1: maxtime)
    elsif maxtime.blank?
      where("runtime_in_minutes >= :var1", var1: mintime)
    else
      where("runtime_in_minutes <= :var1 AND runtime_in_minutes >= :var2", var1: maxtime, var2: mintime)
    end
  end

  def self.title_has(query)
    where("title like :var1", var1: "%#{query}%") 
  end

  def self.director_has(query)
    where("director like :var1", var1: "%#{query}%") 
  end

  def self.search(query)
    where("director like :var1 OR title like :var1", var1: "%#{query}%")
  end

  def review_average
    (reviews.size == 0) ? 0 : reviews.sum(:rating_out_of_ten) / reviews.size
  end

  protected

  def release_date_is_in_the_past
    if release_date.present? && release_date > Date.today
      errors.add(:release_date, "should be in the past")
    end
  end

  def set_color
    # img = MiniMagick::Image.open(self.poster_image.file.file)
    self.color = rand(16777216)
  end

end