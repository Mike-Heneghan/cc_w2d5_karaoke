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
    @guest5 = Guest.new("Lewis")
    @guest6 = Guest.new("Amie")
    @guest7 = Guest.new("Graeme")

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

  def test_capcity_of_room__still_capacity
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_in_guest(@guest4)

    assert_equal(4, @room1.capacity())

  end

  def test_capacity_of_room__unable_to_add_guest
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_in_guest(@guest4)
    @room1.check_in_guest(@guest5)
    @room1.check_in_guest(@guest6)

    assert_equal(5, @room1.capacity())

  end

  def test_capacity_of_room__guest_removed
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_in_guest(@guest4)
    @room1.check_in_guest(@guest5)

    @room1.check_out_guest(@guest2)

    assert_equal(4, @room1.capacity())
  end

  def test_entrance_fees__guest
    @room1.check_in_guest(@guest1)

    assert_equal(5, @room1.total_cash())
    assert_equal(15, @guest1.wallet())

  end

  def test_entrance_fees__many

end
