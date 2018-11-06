class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validate :is_released?


  def is_released?
    if self.released
      if !self.release_year.present?
        errors.add(:release_year, "must be filled")
      else
        if self.release_year > Time.now.year
          errors.add(:release_year, "must not be in the future")
        end
      end
    end
  end

end
