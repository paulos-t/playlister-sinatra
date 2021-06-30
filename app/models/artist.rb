class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.downcase.split.join("-")
    end

    def self.find_by_slug(slug)
        artist_name = slug.split("-").map { |word| word.capitalize }
        artist_name = artist_name.join(" ")
        self.find_by_name(artist_name)
    end
end
