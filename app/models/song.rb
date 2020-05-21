class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: :release_year,
        message: 'cannot be repeated by the same artist in the same year'
    }
    
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Time.now.year
        }
    end

    def released?
        released
    end
end
