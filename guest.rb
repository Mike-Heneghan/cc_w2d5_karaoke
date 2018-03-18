class Guest


attr_reader :name, :wallet, :favourite_song

  def initialize(input_name,input_favourite_song)
    @name = input_name
    @wallet = 20
    @favourite_song = input_favourite_song
  end

  def pay_entrance_fee(entrance_cost)
    @wallet -= entrance_cost
  end

  def celebrate_fav_song()
    return "Yaaaaay they're going to play #{@favourite_song}!"
  end

end
