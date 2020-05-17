require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative('../guest.rb')
require_relative('../room.rb')

class RoomTest < MiniTest::Test

    def setup()
        @karaoke = Karaoke.new("Singalong")
        @room1 = Room.new(10)
        @guest1 = Guest.new("Sam", 20, "Jumping all over the world")
        @guest2 = Guest.new("Pete", 40, "Gold")
    end

    def test_room_max_capacity
        assert_equal(10, @room1.max_capacity)
    end

    def test_song_playing_in_room
        @room1.play_song("Dancing Queen")
        assert_equal("Dancing Queen", @room1.song)
    end

    def test_add_guest_to_room
        @room1.add_guest(@guest1)
        assert_equal("Sam", @room1.guests[0].name)
    end

    def test_remove_guest_from_room
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest2)
        assert_equal(2, @room1.guests.length)
        @room1.remove_guest(@guest1)
        assert_equal(1, @room1.guests.length)
    end

    def test_entry_fee_is_taken
        @room1.add_guest(@guest1)
        assert_equal(10, @guest1.money)
    end

    def test_guest_cant_be_added_to_full_room
        #give guest more funds for this test
        @guest1.money += 100
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        @room1.add_guest(@guest1)
        assert_equal(10, @room1.guests.length)
        #add 1 more guest, shouldnt allow
        @room1.add_guest(@guest2)
        assert_equal(10, @room1.guests.length)
    end

    def test_guest_adding_to_bar_tab
        @room1.add_money_to_tab(@guest2, 30)
        @room1.add_money_to_tab(@guest1, 10)
        assert_equal(40, @room1.bar_tab)
    end



end
