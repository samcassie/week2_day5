require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new


require_relative('../guest.rb')

class GuestTest < MiniTest::Test

    def setup()
        @karaoke = Karaoke.new("Singalong")
        @room1 = Room.new(10)
        @guest1 = Guest.new("Sam", 20, "Jumping all over the world")
        @guest2 = Guest.new("Pete", 40, "Gold")
    end

    def test_guest_fav_song
        assert_equal("Gold", @guest2.fav_song)
    end

    def test_guest_loses_money_on_entry
        @room1.add_guest(@guest2)
        assert_equal(30, @guest2.money)
    end

    def test_sing_to_fav_song
        @room1.play_song("Gold")
        @room1.add_guest(@guest2)
        @guest1.sing_to_fav_song(@room1)
    end

end
