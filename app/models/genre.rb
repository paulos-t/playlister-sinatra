class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.downcase.split.join("-")
    end

    def self.find_by_slug(slug)
        genre_name = slug.split("-").map { |word| word.capitalize }
        genre_name = genre_name.join(" ")
        self.find_by_name(genre_name)
    end
end
