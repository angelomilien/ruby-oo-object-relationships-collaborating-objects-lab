
require "pry"


class Song
    
    attr_accessor :name, :artist, :artist_name
    
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    #Real Estate - It's Real - hip-hop.mp3 (filename example)
    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song
    end

    def artist_name=(name)
       self.artist = Artist.find_or_create_by_name(name)

    end
    # binding.pry   
end


# song.artist_name = "Michael Jackson"