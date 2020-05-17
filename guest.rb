require_relative('room.rb')

class Guest < Room

    attr_accessor :name, :fav_song, :money

    def initialize(name, money, fav_song)
        @name = name
        @fav_song = fav_song
        @money = money
    end

    def sing_to_fav_song(room)
        if room.song = @fav_song
            p "Woohoo!"
        end
    end

end
