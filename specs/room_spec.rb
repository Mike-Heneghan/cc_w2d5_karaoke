require("minitest/autorun")
require("minitest/rg")

require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup

    @guest1 = Guest.new("Mike")
    @guest2 = Guest.new("Mariana")
    @guest3 = Guest.new("Andrew")
    @guest4 = Guest.new("Claudia")

    @song1 = Song.new("Redbone", "Childish Gambino")
    @song2 = Song.new("Orthodox Man", "Blaenavon")
    @song3 = Song.new("On Hold", "The XX")

    @room1 = Room.new(1)
    @room2 = Room.new(2)

  end

  def test_of_room_creation
    result_name = @room1.name_room()
    result_guests = @room1.occupants.length()
    result_songs = @room1.playlist.length()

    assert_equal(1, result_name)
    assert_equal(0, result_guests)
    assert_equal(0, result_songs)

  end

  def test_add_song_to_playlist
    @room1.add_song_to_playlist(@song3)
    assert_equal(1,@room1.playlist.length())
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest2)
    assert_equal(1,@room1.occupants.length)
  end

  def test_check_out_guest
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_out_guest(@guest2)

    assert_equal(2, @room1.occupants.length)
    assert_equal([@guest1, @guest3], @room1.occupants())
  end

  
end
