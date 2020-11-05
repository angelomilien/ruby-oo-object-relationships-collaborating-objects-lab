
require "pry"

class MP3Importer
    #music_importer is instance on test spec

    attr_accessor :music_path, :path
    
    @@files = []

    def initialize(music_path)
        @music_path = music_path
    end
    
    def save
        mp3s_files = Dir.entries(music_path)
        return_data = mp3s_files.grep(/.+-.+\.mp3/)
        return_data.each{|mp3s| @@files << mp3s}  
    end

    def path
        @music_path
    end

    def files
        save
        @@files
    end

    def import
        @@files.each{ |filename| Song.new_by_filename(filename) }
    end

end