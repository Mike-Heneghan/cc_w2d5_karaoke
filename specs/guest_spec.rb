require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike","Orthodox Man")
    @guest2 = Guest.new("Mariana", "On Hold")
    @guest3 = Guest.new("Andrew", "Redbone")
    @guest4 = Guest.new("Claudia", "Two Weeks")
  end

  def test_creation_of_guest
    assert_equal("Mike",@guest1.name())
    assert_equal(20, @guest1.wallet())
    assert_equal("On Hold", @guest2.favourite_song())
  end

  def test_pay_entrance_fee
    @guest1.pay_entrance_fee(5)
    assert_equal(15, @guest1.wallet())
  end

  def test_celebrate_fav_song
    assert_equal("Yaaaaay they're going to play Orthodox Man!", @guest1.celebrate_fav_song())
  end

end
