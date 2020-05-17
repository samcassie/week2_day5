require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative('../karaoke.rb')
require_relative('../room.rb')
require_relative('../guest.rb')

class KaraokeTest < MiniTest::Test

    def setup()
        @karaoke = Karaoke.new("Singalong")
        @room1 = Room.new(10)
        @guest1 = Guest.new("Sam", 20, "Jumping all over the world")
        @guest2 = Guest.new("Pete", 40, "Gold")
    end


    def test_karaoke_name
        assert_equal("Singalong", @karaoke.name)
    end

    def test_room_added
        @karaoke.add_rooms(@room1)
        assert_equal(1, @karaoke.rooms.length)
    end


end
