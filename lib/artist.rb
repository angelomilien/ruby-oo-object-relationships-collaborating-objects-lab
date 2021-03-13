
class Artist
    
    attr_accessor :name

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
    
    def songs
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end
    
    def self.create_by_name(name)
        person = self.new(name)
    end

    def self.find_by_name(name)
        self.all.find { |artist| artist.name == name }
    end

    def self.find_or_create_by_name(artist_name)
        self.create_by_name(artist_name) if self.all.include?(self.find_by_name(artist_name)) == false
        self.find_by_name(artist_name)  
    end

    def print_songs
        puts self.songs.collect {|song| song.name}
    end
end