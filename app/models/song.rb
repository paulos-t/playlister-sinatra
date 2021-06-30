class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.downcase.split.join("-")
    end

    def self.find_by_slug(slug)
        song_name = slug.split("-").map { |word| word.capitalize }
        song_name = song_name.join(" ")
        self.find_by_name(song_name)
    end
end
