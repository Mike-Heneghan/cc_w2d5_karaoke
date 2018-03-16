require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike")
    @guest2 = Guest.new("Mariana")
    @guest3 = Guest.new("Andrew")
    @guest4 = Guest.new("Claudia")
  end

  def test_creation_of_guest
    assert_equal("Mike",@guest1.name())
  end

end
