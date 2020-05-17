require_relative('karaoke.rb')

class Room < Karaoke

    attr_accessor :song, :max_capacity, :guests, :bar_tab

    def initialize(max_capacity)
        @song = ""
        @max_capacity = max_capacity
        @guests = []
        @entry_fee = 10
        @bar_tab = 0
    end

    def play_song(song_name)
        @song = song_name
    end

    def add_guest(guest)
        if @guests.length < @max_capacity
            if guest.money >= @entry_fee
                guest.money -= @entry_fee
                @guests.push(guest)
            else
                p "Not enough money for entrance fee!"
            end
        else
            p "Room is full!"
        end
    end

    def remove_guest(guest)
        @guests.delete(guest)
    end

    def add_money_to_tab(guest, money)
        if money <= guest.money
            guest.money -= money
            @bar_tab += money
        else
            p "Insufficient money!"
        end
    end



end
