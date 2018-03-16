require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup

    @song1 = Song.new("Redbone", "Childish Gambino")

    @song2 = Song.new("Orthodox Man", "Blaenavon")

    @song3 = Song.new("On Hold", "The XX")
  end

  def test_creation_of_song
    assert_equal("The XX", @song3.artist())
    assert_equal("Orthodox Man", @song2.title())
  end
  
end
